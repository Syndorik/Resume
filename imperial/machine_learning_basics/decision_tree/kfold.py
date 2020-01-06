from metrics import calc_accuracy
from decision_tree import build_tree_and_prune, build_decision_tree
import numpy as np
from multiprocessing import Pool
from functools import partial


def kfold(dataset: np.ndarray, k_folds: int, run_pruning=True, n_jobs=1):
    """
    Args:
        dataset: The full dataset on which to run k-fold
        k_folds: Number of folds to use
        run_pruning: Whether to run pruning
    Returns:
         a tuple (models, training_sets) , where models is a list of the k
         models and training_sets is a list of the training sets left out in
         generating respective models
    """
    # returns models and test sets
    np.random.shuffle(dataset)
    folds = get_folds(dataset, k_folds)
    if n_jobs > 1:
        pool = Pool(processes=n_jobs)
        models = pool.map(
                partial(train_one_fold, folds, run_pruning=run_pruning),
                range(len(folds)),
            )
    else:
        models = [train_one_fold(folds, test_index, run_pruning) for test_index in range(len(folds))]
    return models, folds


def get_folds(dataset, num_folds):
    fold_size = dataset.shape[0] // num_folds
    folds = [
        dataset[i * fold_size : (i + 1) * fold_size]
        for i in range(num_folds - 1)
    ]
    folds.append(dataset[(num_folds - 1) * fold_size :])
    return folds


def train_one_fold(folds, test_index, run_pruning=True):
    """Trains decision trees according to K-fold regime
    Splits the dataset into `num_folds` partitions and cycles one of these
    partitions as the validation set. The remaining partitions are used to
    train the decision tree.
    Returns all trained models.

    Args:
        folds:       The partitioned dataset
        run_pruning: Optional. A boolean representing whether or not to prune
                     the tree after training.
    """
    if run_pruning:
        model = None
        best_accuracy = -1
        for validation_index in [
            f for f in range(len(folds)) if f != test_index
        ]:
            training_set = np.array(
                [
                    sample
                    for f, fold in enumerate(folds)
                    for sample in fold
                    if f != test_index and f != validation_index
                ]
            )
            validation_set = folds[validation_index]
            candidate_model = build_tree_and_prune(
                training_set, validation_set
            )
            candidate_accuracy = calc_accuracy(
                validation_set, model=candidate_model
            )
            if candidate_accuracy > best_accuracy:
                model = candidate_model
                best_accuracy = candidate_accuracy
    else:
        training_set = np.array(
            [
                sample
                for f, fold in enumerate(folds)
                for sample in fold
                if f != test_index
            ]
        )
        model = build_decision_tree(training_set)
    return model
