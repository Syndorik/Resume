import pickle
from time import time

import numpy as np
import tensorflow as tf
from sklearn.base import BaseEstimator
from sklearn.model_selection import RandomizedSearchCV
from sklearn.preprocessing import StandardScaler
from tensorflow.keras import layers, regularizers

from lib import helpers

"""
TODO:
- Implement the helpers in helpers.py to deal with imbalanced dataset
- Use AUC as a metric for hyperparameter search
- Narrow the hyperparameter search to search a smaller space
- Get decent results
- Write about the results
- Make it work with LabTS
- Tidy HyperParameterSearch so it's easily readable (but they won't run it, 
    so it doesn't have to perfectly reflect how we did it.  

"""


def load_model(load_path="part2_claim_classifier.h5"):
    model = ClaimClassifier()
    with open("part2_claim_classifier_preprocessor.pickle", "rb") as target:
        model.scaler = pickle.load(target)
    model.load_model(load_path)
    return model


class ClaimClassifier(BaseEstimator):
    def __init__(
        self,
        *,
        batch_size=8,
        architecture=(64, 64, 64),
        learning_rate=1e-3,
        loss=tf.keras.losses.BinaryCrossentropy(),
        optimizer=tf.keras.optimizers.Adam,
        metrics=[tf.keras.losses.BinaryCrossentropy(), "accuracy", "AUC"],
        epochs=10,
        l1_weight=0,
        l2_weight=0,
        activation_function="relu",
    ):
        # Save this so we can recover hyperparameters from model
        self.architecture = architecture
        self.learning_rate = learning_rate
        self.loss = loss
        self.optimizer = optimizer
        self.metrics = [tf.keras.metrics.AUC]
        self.batch_size = batch_size
        self.epochs = epochs
        self.l1_weight = l1_weight
        self.l2_weight = l2_weight
        self.activation_function = activation_function

        # Prepro
        self.scaler = StandardScaler()

        # Model
        self.model = tf.keras.Sequential(
            [
                layers.Dense(
                    architecture[0],
                    activation=self.activation_function,
                    input_shape=(9,),
                    activity_regularizer=regularizers.l1_l2(l1=l1_weight, l2=l2_weight),
                )
            ]
            + [
                layers.Dense(
                    num_neurons,
                    activation=self.activation_function,
                    activity_regularizer=regularizers.l1_l2(l1=l1_weight, l2=l2_weight),
                )
                for num_neurons in architecture[1:]
            ]
            + [
                layers.Dense(
                    1, activation="sigmoid", activity_regularizer=regularizers.l1_l2(l1=l1_weight, l2=l2_weight)
                )
            ]
        )
        self.model.compile(optimizer=optimizer(learning_rate), loss=loss, metrics=metrics)
        self.best_validation_score = 0

        """
        Feel free to alter this as you wish, adding instance variables as
        necessary. 
        """

    def __str__(self):
        return (
            f"ClaimClassifier<"
            f"architecture={self.architecture}, "
            f"learning_rate={self.learning_rate}, "
            f"activation_function={self.activation_function}, "
            f"loss={self.loss}, "
            f"l1_weight={self.l1_weight}, "
            f"l2_weight={self.l2_weight}, "
            f"optimizer={self.optimizer}, "
            f"batch_size={self.batch_size}, "
            f"epochs={self.epochs}, "
            f"metrics={self.metrics}>"
        )

    def _preprocessor(self, X_raw):
        """Data preprocessing function.

        This function prepares the features of the data for training,
        evaluation, and prediction.

        Parameters
        ----------
        X_raw : numpy.ndarray (NOTE, IF WE CAN USE PANDAS HERE IT WOULD BE GREAT)
            A numpy array, this is the raw data as downloaded

        Returns
        -------
        X: numpy.ndarray (NOTE, IF WE CAN USE PANDAS HERE IT WOULD BE GREAT)
            A clean data set that is used for training and prediction.
        """
        return self.scaler.transform(X_raw)

    def fit(self, X_raw, y_raw, validation_data=None):
        """Classifier training function.

        Here you will implement the training function for your classifier.

        Parameters
        ----------
        X_raw : numpy.ndarray
            A numpy array, this is the raw data as downloaded
        y_raw : numpy.ndarray (optional)
            A one dimensional numpy array, this is the binary target variable

        Returns
        -------
        ?
        """
        X_train, Y_train, X_test, Y_test = helpers.split_dataset(X, Y, test_ratio=0.15, ones_ratio=0.5)

        self.scaler.fit(X_train)
        X_train_clean = self._preprocessor(X_train)
        X_test_clean = self._preprocessor(X_test)

        train_generator = helpers.iml_generator(X_train_clean, Y_train, batch_size=self.batch_size)
        test_generator = helpers.iml_generator(X_test_clean, Y_test, batch_size=self.batch_size)

        callbacks = [
            tf.keras.callbacks.ModelCheckpoint(
                "part2_claim_classifier.h5", save_best_only=True, monitor="val_AUC", mode="min", save_weights_only=True
            ),
            tf.keras.callbacks.ReduceLROnPlateau(
                monitor="val_loss", factor=0.1, patience=7, verbose=1, epsilon=1e-4, mode="min"
            ),
        ]

        history = self.model.fit_generator(
            generator=train_generator,
            validation_data=test_generator,
            epochs=10,
            steps_per_epoch=len(X_train_clean) // self.batch_size,
            validation_steps=len(X_test_clean) // self.batch_size,
            callbacks=callbacks
        )
        self.best_validation_score = max(history.history["val_AUC"])

    def predict(self, X_raw):
        """Classifier probability prediction function.

        Here you will implement the predict function for your classifier.

        Parameters
        ----------
        X_raw : numpy.ndarray
            A numpy array, this is the raw data as downloaded

        Returns
        -------
        numpy.ndarray
            A one dimensional array of the same length as the input with
            values corresponding to the probability of beloning to the
            POSITIVE class (that had accidents)
        """

        X_clean = self._preprocessor(X_raw)
        return self.model.predict(X_clean) > 0.5

    def score(self, X_test, Y_test):
        return self.best_validation_score

    def evaluate_architecture(self, X_test, Y_test):
        """Architecture evaluation utility.

        Populate this function with evaluation utilities for your
        neural network.

        You can use external libraries such as scikit-learn for this
        if necessary.
        """
        return max(self.model.evaluate(X_test, Y_test))

    def save_model(self, save_path="part2_claim_classifier.h5"):
        with open("part2_claim_classifier_preprocessor.pickle", "wb") as target:
            pickle.dump(self.scaler, target)
        # self.model.save_weights(save_path)

    def load_model(self, load_path="part2_claim_classifier.h5"):
        self.model.load_weights(load_path)

    def get_params(self, deep=True):
        return {
            "architecture": self.architecture,
            "learning_rate": self.learning_rate,
            "loss": self.loss,
            "optimizer": self.optimizer,
            "batch_size": self.batch_size,
            "epochs": self.epochs,
            "l1_weight": self.l1_weight,
            "l2_weight": self.l2_weight,
            "activation_function": self.activation_function,
        }

    def set_params(self, **params):
        if "architecture" in params:
            self.architecture = params["architecture"]
        if "learning_rate" in params:
            self.learning_rate = params["learning_rate"]
        if "loss" in params:
            self.loss = params["loss"]
        if "optimizer" in params:
            self.optimizer = params["optimizer"]
        if "batch_size" in params:
            self.batch_size = params["batch_size"]
        if "l1_weight" in params:
            self.l1_weight = params["l1_weight"]
        if "l2_weight" in params:
            self.l2_weight = params["l2_weight"]
        if "activation_function" in params:
            self.activation_function = params["activation_function"]
        return self


def permutations(num_layers, poss):
    if num_layers == 1:
        return [[p] for p in poss]
    prev_layers = permutations(num_layers - 1, poss)
    return [[p] + pl for pl in prev_layers for p in poss]


def clean_architectures(archs):
    removed_zero_layers = [tuple(layer for layer in arch if layer != 0) for arch in archs]
    return np.unique(removed_zero_layers)


def potential_architectures(layer_range, neuron_possibilities):
    possible_archs = permutations(layer_range[1], neuron_possibilities)
    clean_archs = clean_architectures(possible_archs)
    return [arch for arch in clean_archs if len(arch) > layer_range[0]]


def ClaimClassifierHyperParameterSearch(X, Y, n_iter=10):
    """Performs a hyper-parameter for fine-tuning the classifier.

    Implement a function that performs a hyper-parameter search for your
    architecture as implemented in the ClaimClassifier class.

    The function should return your optimised hyper-parameters.

    Parameters
        ----------
        mode : str
            Could be either "grid" or "random" representing Grid Search and Random Search respectively

    Returns
        -------
        tuple
            A tuple with the final chosen hyperparameters.
    """
    # Define parameters to search
    activation_functions = [tf.nn.leaky_relu, "relu", "sigmoid", "tanh"]
    batch_sizes = np.exp2(range(4, 8)).astype(np.int32)
    epochs = range(10, 60, 10)
    learning_rates = np.exp(np.linspace(-1, -6, 10))
    optimizers = [
        tf.keras.optimizers.Adam,
        tf.keras.optimizers.Adagrad,
        tf.keras.optimizers.Nadam,
        tf.keras.optimizers.RMSprop,
        tf.keras.optimizers.SGD,
    ]
    regularizers_l1 = np.exp(np.linspace(-5, 0, 10))
    regularizers_l2 = np.exp(np.linspace(-5, 0, 10))

    # Architecture space
    layer_range = [1, 4]
    neurons_per_layer_options = [0, 1, 2, 4, 8, 16, 32, 64, 128, 512, 1024]
    architectures = potential_architectures(layer_range, neurons_per_layer_options)

    search = RandomizedSearchCV(
        ClaimClassifier(),
        {
            "learning_rate": learning_rates,
            "optimizer": optimizers,
            "batch_size": batch_sizes,
            "epochs": epochs,
            "l1_weight": regularizers_l1,
            "l2_weight": regularizers_l2,
            "activation_function": activation_functions,
            "architecture": architectures,
        },
        n_iter=n_iter,
    )

    search.fit(X, Y)

    return search


if __name__ == "__main__":
    data = np.genfromtxt("data/part2_data.csv", delimiter=",", skip_header=1)
    X = data[:, :-2]
    Y = data[:, -1]
    start = time()
    search = ClaimClassifierHyperParameterSearch(X, Y, n_iter=200)
    end = time()
    print(f"Time to compute: {end - start:.3f} seconds")
    print(search)
    print("Best hyperparameter combination found")
    print(search.best_params_)
    print()
    print("Grid scores on development set:")
    print()
    means = search.cv_results_["mean_test_score"]
    stds = search.cv_results_["std_test_score"]
    for mean, std, params in zip(means, stds, search.cv_results_["params"]):
        print("%0.3f (+/-%0.03f) for %r" % (mean, std * 2, params))

    model = search.best_estimator_
    # print("Grid scores on development set:")
    # print()
    # means = search.cv_results_["mean_test_score"]
    # stds = search.cv_results_["std_test_score"]
    # for mean, std, params in zip(means, stds, search.cv_results_["params"]):
    #     print("%0.3f (+/-%0.03f) for %r" % (mean, std * 2, params))

    model = ClaimClassifier()
    model.fit(X, Y)
    model.save_model()
