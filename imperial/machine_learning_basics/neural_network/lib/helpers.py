import numpy as np


def split_dataset(X, Y, test_ratio=0.15, ones_ratio=0.25):
    """Splits a dataset into train and test subsets
    Splits the dataset into train and test subsets according to the `test_ratio`.
    The split is made in such a way that the test set is guaranteed to have a percentage of `ones_ratio` samples
    classified as 1.
    :param X: Features of the dataset
    :param Y: Labels of the dataset
    :param test_ratio: Percentage of the dataset to be used as test set
    :param ones_ratio: Percentage of sample in the test set that are of class 1
    :return: A tuple containing train features, train labels, test features and test labels respectively.
    """
    # Find indices that correspond to labels 0 and 1
    if isinstance(Y, np.ndarray):
        zeros = np.where(Y == 0)[0]
        ones = np.where(Y == 1)[0]
    else:
        zeros = Y[Y == 0].index
        ones = Y[Y == 1].index

    # Calculate the amount of samples per label for the test set
    test_zeros_size = int(len(zeros) * (1 - ones_ratio) * test_ratio)
    test_ones_size = int(len(ones) * ones_ratio * test_ratio)

    # Select indices that will go to the test set
    zeros_mask = np.zeros(len(zeros), dtype=np.bool)
    ones_mask = np.zeros(len(ones), dtype=np.bool)
    zeros_mask[:test_zeros_size] = True
    ones_mask[:test_ones_size] = True

    np.random.shuffle(zeros_mask)
    np.random.shuffle(ones_mask)

    # Build all subsets of main dataset
    if isinstance(X, np.ndarray):

        test_set_X = X[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_X = X[[*zeros[~zeros_mask], *ones[~ones_mask]]]
    else:
        test_set_X = X.loc[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_X = X.loc[[*zeros[~zeros_mask], *ones[~ones_mask]]]
    if isinstance(Y, np.ndarray):
        test_set_Y = Y[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_Y = Y[[*zeros[~zeros_mask], *ones[~ones_mask]]]
    else:
        test_set_Y = Y.loc[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_Y = Y.loc[[*zeros[~zeros_mask], *ones[~ones_mask]]]
    return training_set_X, training_set_Y, test_set_X, test_set_Y


def split_dataset_with_claim(X, Y, X_claim, test_ratio=0.15, ones_ratio=0.25):
    """Splits a dataset into train and test subsets
    Splits the dataset into train and test subsets according to the `test_ratio`.
    The split is made in such a way that the test set is guaranteed to have a percentage of `ones_ratio` samples
    classified as 1.
    :param X: Features of the dataset
    :param Y: Labels of the dataset
    :param test_ratio: Percentage of the dataset to be used as test set
    :param ones_ratio: Percentage of sample in the test set that are of class 1
    :return: A tuple containing train features, train labels, test features and test labels respectively.
    """
    # Find indices that correspond to labels 0 and 1
    if isinstance(Y, np.ndarray):
        zeros = np.where(Y == 0)[0]
        ones = np.where(Y == 1)[0]
    else:
        zeros = Y[Y == 0].index
        ones = Y[Y == 1].index

    # Calculate the amount of samples per label for the test set
    test_zeros_size = int(len(zeros) * (1 - ones_ratio) * test_ratio)
    test_ones_size = int(len(ones) * ones_ratio * test_ratio)

    # Select indices that will go to the test set
    zeros_mask = np.zeros(len(zeros), dtype=np.bool)
    ones_mask = np.zeros(len(ones), dtype=np.bool)
    zeros_mask[:test_zeros_size] = True
    ones_mask[:test_ones_size] = True

    np.random.shuffle(zeros_mask)
    np.random.shuffle(ones_mask)

    # Build all subsets of main dataset
    if isinstance(X, np.ndarray):
        test_set_X = X[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_X = X[[*zeros[~zeros_mask], *ones[~ones_mask]]]
        training_set_X_claim = X_claim[[*zeros[~zeros_mask], *ones[~ones_mask]]]
    else:
        test_set_X = X.loc[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_X = X.loc[[*zeros[~zeros_mask], *ones[~ones_mask]]]
        training_set_X_claim = X_claim.loc[[*zeros[~zeros_mask], *ones[~ones_mask]]]

    if isinstance(Y, np.ndarray):
        test_set_Y = Y[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_Y = Y[[*zeros[~zeros_mask], *ones[~ones_mask]]]
    else:
        test_set_Y = Y.loc[[*zeros[zeros_mask], *ones[ones_mask]]]
        training_set_Y = Y.loc[[*zeros[~zeros_mask], *ones[~ones_mask]]]
    return training_set_X, training_set_Y, test_set_X, test_set_Y, training_set_X_claim


def iml_generator(X, Y, *, batch_size=64, ones_ratio=0.25):
    """Batch generator
    Returns a generator that yields batches of `batch_size` examples from the given dataset.
    The number of samples of each class  is balanced according to `ones_ratio`.
    :param X: Features of the dataset
    :param Y: Labels of the dataset
    :param batch_size: The number of samples in the batch
    :param ones_ratio: Percentage of examples in the batch that are of class 1
    :return: Generator that yields batches
    """
    zeros = np.where(Y == 0)[0]
    ones = np.where(Y == 1)[0]
    batch_size_1 = int(batch_size * ones_ratio)
    batch_size_0 = batch_size - batch_size_1
    while True:
        ii = np.random.choice(zeros, size=batch_size_0)
        jj = np.random.choice(ones, size=batch_size_1)
        xs = np.concatenate([X[ii], X[jj]])
        ys = np.concatenate([Y[ii], Y[jj]])
        yield xs, ys


def separate_labels(dataset, label_columns):
    feature_columns = [col for col in dataset.columns if col not in label_columns]
    return (dataset[feature_columns], *[dataset[label_column] for label_column in label_columns])
