import numpy as np


def split_dataset(dataset, k=10):
    """
    Shuffles a dataset and returns a training set and validation set, sizes
    proportional to 1/k and (k-1)/k
    Args:
        dataset: the full dataset
        k: split ratio
    Returns:
        training set, validation set
    """
    np.random.shuffle(dataset)
    split_index = len(dataset) // k
    return dataset[split_index:], dataset[:split_index]
