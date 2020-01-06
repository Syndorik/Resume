import numpy as np


def calc_accuracy(test_set, model):
    """Calculates the accuracy of a given model with respect to a dataset

    Args:
        dataset:    A numpy array containing the test set.
                    The last column represents the label
        model:      A Node object representing the decision tree to be
                    evaluated
    """
    predictions = model.predict(test_set)
    ground_truths = test_set[:, -1].astype(int)
    return np.mean(predictions == ground_truths)


def calc_confusion_matrix(test_set, model):
    """Calculates the confusion matrix of a given model with respect to a
       dataset

    Args:
        test_set:   A numpy array containing the test set.
                    The last column represents the label
        model:      A Node object representing the decision tree to be
                    evaluated
    """
    confusion_matrix = np.zeros((4, 4))
    predictions = model.predict(test_set)
    ground_truths = test_set[:, -1].astype(int)
    for i, j in zip(predictions, ground_truths):
        confusion_matrix[i - 1, j - 1] = confusion_matrix[i - 1, j - 1] + 1
    return confusion_matrix


def calc_precision(confusion_matrix):
    """Calculates the precision of a given model based on the confusion matrix

    Args:
        confusion_matrix:   The confusion matrix with which to calculate
                            precision
    """
    predicted = confusion_matrix.sum(1)
    correct = confusion_matrix.diagonal()
    return correct / predicted


def calc_recall(confusion_matrix):
    """Calculates the recall of a given model based on the confusion_matrix

    A model or previously computed predictions should be provided, however not
    both at once.

    Args:
        confusion_matrix:    The confusion matrix with which to calculate
                             precision
    """
    predicted = confusion_matrix.sum(0)
    correct = confusion_matrix.diagonal()
    return correct / predicted


def calc_f1(precision, recall):
    """Calculates the F1-score of a given model given precision and recall"""
    return 2 * recall * precision / (recall + precision)


def get_all_metrics(models, test_sets):
    """
    Evaluate metrics following k-fold on the k models and k test sets
    Args:
        models: list of Nodes.  Represents the decision trees to be evaluated
                (corresponding with the test_sets)
        test_sets:  list of 2D numpy arrays. Each test set corresponds with a
                    model, where that test set was omitted in k-fold when
                    creating that model

    Returns:
        A dictionary containing:
        - `Confusion Matrix`: a 4x4 confusion matrix, calculated as the sum of
                              the confusion matrices for each `test_set` and
                              used for all other metric calculations
        - `Average Accuracy`: The average accuracy across all `test_set`s
        - `Precision`: a list with the precision for each class (i.e. room)
        - `Average Precision`: The average precision across classes
                               (i.e. rooms)
        - `Recall`: a list with the recall for each class (i.e. room)
        - `Average Recall`: The average recall across all classes (i.e. rooms)
        - `F1`: a list with the F1 for each each class (i.e. room)
        - `Average F1`: The average F1 across all classes (i.e. rooms)
        - `Height`: a list with the maximum height for each model
        - `Average Height`: the average height across the models

    """
    k_folds = len(models)
    avg_confusion_matrix = np.zeros((4, 4))
    for model, dataset in zip(models, test_sets):
        avg_confusion_matrix = avg_confusion_matrix + calc_confusion_matrix(
            dataset, model
        )
    avg_confusion_matrix = avg_confusion_matrix / k_folds
    precision = calc_precision(avg_confusion_matrix)
    recall = calc_recall(avg_confusion_matrix)
    f1 = calc_f1(precision, recall)
    accuracy = (
        avg_confusion_matrix.diagonal().sum() / avg_confusion_matrix.sum()
    )
    heights = [model.max_height() for model in models]

    return {
        "Confusion Matrix": avg_confusion_matrix,
        "Precision": precision,
        "Recall": recall,
        "F1": f1,
        "Height": heights,
        "Average Precision": precision.mean(),
        "Average Recall": recall.mean(),
        "Average F1": f1.mean(),
        "Accuracy": accuracy,
        "Average Height": np.mean(heights),
    }


def evaluate(test_db,trained_tree):
    """
    For API use only: returns accuracy of a tree, given a test dataset.

    Args:
        test_db: The test dataset
        trained_tree: Node. The trained tree

    Returns: Accuracy, as a float between 0 and 1

    """
    return calc_accuracy(test_db,trained_tree)