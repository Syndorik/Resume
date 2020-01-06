from functools import partial
from multiprocessing import Pool, cpu_count

import numpy as np

from metrics import calc_accuracy
from tree_structures import Node, Split


def build_decision_tree(dataset: np.ndarray, n_jobs=1):
    """Fits a decision tree model to a given dataset

    This function overfits the training data to 100% accuracy. For
    regularization methods, please refer to the `prune` function.

    Args:
        dataset:     A numpy array containing the dataset. The last column
                     represents the label
        n_jobs:      The number of processes to spawn during training
                     (will parallelize n_jobs if >1)
    """
    if dataset.size == 0:
        raise ValueError("Cannot build a decision tree from an empty dataset")
    if np.unique(dataset[:, -1]).size == 1:
        return Node(room=dataset[0, -1])
    if n_jobs > 1:
        split, left, right = get_split_parallelized(dataset, n_jobs)
    else:
        split, left, right = get_split(dataset)
    left_node = build_decision_tree(left)
    right_node = build_decision_tree(right)
    return Node(left=left_node, right=right_node, split=split)


def build_tree_and_prune(training_set, validation_set, njob=1):
    """
    Args:
        training_set: The training set
        validation_set: The validation set
        njob: (optional) the number of jobs to use, if multi-threading

    Returns:
        The pruned decision tree
    """
    tree = build_decision_tree(training_set, njob)
    prune(validation_set, tree, training_set)
    return tree


# Splitting function


def get_split(dataset):
    """Finds the best feature and value combination to split a given dataset

    This function iterates over all attributes and possible split values for a
    given attribute and returns the split with the most gain.

    Args:
        dataset:     A numpy array containing the dataset. The last column
                     represents the label
    """
    # Check if dataset is empty
    if dataset.size == 0:
        raise ValueError("Cannot get a split in an empty dataset")

    # Init Variables

    best_split = None
    best_left = None
    best_right = None
    best_gain = float("-inf")

    for attributeIndex in range(dataset.shape[1] - 1):
        # Get the dataset sorted by according to an attribute
        sorted_dataset = dataset[dataset[:, attributeIndex].argsort()]
        lastval = None

        # Find the best split for the attribute
        for i, row in enumerate(sorted_dataset):

            # Repeat only if the split value is different
            if row[attributeIndex] == lastval:
                continue

            # Gain comparison
            lastval = row[attributeIndex]
            left = sorted_dataset[:i]
            right = sorted_dataset[i:]
            gain = get_gain(sorted_dataset, left, right, optimized=True)
            if gain >= best_gain:
                best_gain = gain
                best_split = Split(attributeIndex, lastval)
                best_left, best_right = left, right

    return best_split, best_left, best_right


def get_split_parallelized(dataset, njob=cpu_count()):
    """Finds the best feature and value combination to split a given dataset

    This function iterates overall attributes and possible split values for a
    given attribute and returns the split with the most gain.

    This is a parellelized implementation of `get_split`

    Args:
        dataset:     A numpy array containing the dataset. The last column
                     represents the label
        njob:      The number of processes to spawn during training
    """
    # Check if dataset is empty
    if dataset.size == 0:
        raise ValueError("Cannot get a split in an empty dataset")

    # Init Variables
    best_split = None
    best_left = None
    best_right = None
    best_gain = -1000
    size = len(dataset)
    pool = Pool(processes=njob)

    for attributeIndex in range(7):
        # Get the dataset sorted by a column
        sorted_dataset = dataset[dataset[:, attributeIndex].argsort()]

        # Get best gain and best split for the current attribute
        index_dataset = list(range(size))
        gain_dataset = np.array(
            pool.map(
                partial(intermediate_gain, sortedDataset=sorted_dataset),
                index_dataset,
            )
        )

        index_g = np.argmax(gain_dataset)
        g_int = gain_dataset[index_g]

        # Check whether it's the best solution
        if g_int >= best_gain:
            best_gain = g_int
            best_split = Split(
                attributeIndex, dataset[index_g, attributeIndex]
            )
            best_left, best_right = (
                sorted_dataset[0:index_g],
                sorted_dataset[index_g:],
            )

    return best_split, best_left, best_right


# Utility functions to split


def get_gain(dataset, left, right, optimized=False):
    """Computes the gain of a given dataset split

    This function computes the gain obtained by partitioning the overall
    dataset into a pair of given subdatasets.

    Args:
        dataset:    A numpy array containing the full dataset.
                    The last column represents the label.
        left:       A numpy array containing a subset of the full dataset.
                    The last column represents the label
        right:      A numpy array containing a subset of the full dataset.
                    The last column represents the label
        optimized:  A boolean variable representing whether or not to run an
                    optimized version of the gain. If set to True, the actual
                    gain is not computed, rather an equivalent value is
                    calculated for comparison purposes only.
    """
    if optimized:
        # We may disregard the __full dataset entropy__ since its the same when
        # choosing an attibute on which to split.
        # Warning: by setting `optimized` to True, the return value won't be
        # the exact gain. Should be used for comparative purposes only.
        return -((left.shape[0] / dataset.shape[0]) * entropy(left)) - (
            (right.shape[0] / dataset.shape[0]) * entropy(right)
        )

    else:
        return (
            entropy(dataset)
            - ((left.shape[0] / dataset.shape[0]) * entropy(left))
            - ((right.shape[0] / dataset.shape[0]) * entropy(right))
        )


def entropy(dataset):
    """Computes the entropy of a given dataset

    Args:
        dataset:    A numpy array containing the full dataset. The last column
                    represents the label.
    """
    total = dataset.shape[0]
    labels = dataset[:, -1]
    _, counts = np.unique(labels, return_counts=True)
    p = counts / total
    return -(p * (np.log2(p))).sum()


def intermediate_gain(l, sorted_dataset):
    """Return the gain for a split at index l

    This is a parallel version of the `gain` function

    Args:
        l: Integer, index of the split
        sorted_dataset: Numpy array (1xN) after the binary sort of the dataset
    """
    left = sorted_dataset[0:l]
    right = sorted_dataset[l:]
    gain = get_gain(sorted_dataset, left, right)
    return gain


# Pruning

def get_merge_leaf(training_set):
    """
    Get the theoretical leaf label from a training set narrowed down to a certain node. (Used only in prune.)
    Args:
        training_set: a training set that's been narrowed down to a node

    Returns: the label for the leaf, if the node's children are merged

    """
    labels, counts = np.unique(training_set[:, -1], return_counts=True)
    merge_label = labels[np.argmax(counts)]
    return merge_label


def prune(
    validation_set: np.ndarray, model: Node, training_set: np.ndarray
) -> Node:
    """
    Prunes a decision tree in-place according to a validation set

    Checks whether removing a node from the tree improves a given metric with
    respect to a validation set. Based on this, prunes depreciating nodes and
    returns the resulting tree

    Args:
        validation_set:     The validation set, used to prune the tree
        model:              The decision tree to be pruned
        training_set:       The training set, used to decide on the label for
                            leaves created after pruning
    """
    # If it's a leaf, there's nothing to prune
    if model.room is not None:
        return

    # If the validation_set is empty, that means that it's accuracy with respect to this node can't be made any worse
    # by pruning, so just prune.
    if validation_set.shape[0] == 0:
        merge_room = get_merge_leaf(training_set)
        model.room = merge_room
        return
    # Separate left and right datasets according to `node.split`
    (left_training_set, right_training_set) = model.split.divide_dataset(
        training_set
    )
    (left_validation_set, right_validation_set) = model.split.divide_dataset(
        validation_set
    )

    # Update left and right nodes recursively

    prune(left_validation_set, model.left, left_training_set)
    prune(right_validation_set, model.right, right_training_set)

    # Node must be connected to two leaves
    if model.left.room is None or model.right.room is None:
        return

    # Calculate class if node were to merge its children
    merge_room = get_merge_leaf(training_set)

    # Check if pruning is worth it by comparing a metric
    merge_metric = np.mean(validation_set[:, -1] == merge_room)
    baseline_metric = calc_accuracy(validation_set, model=model)
    if merge_metric >= baseline_metric:
        # Prune
        model.room = merge_room

