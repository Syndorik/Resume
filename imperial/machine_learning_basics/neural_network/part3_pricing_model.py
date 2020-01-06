import pickle

import numpy as np
import pandas as pd
from sklearn.calibration import CalibratedClassifierCV, _CalibratedClassifier

from lib import helpers
from lib.pricing_model_preprocessor import PricingModelPreprocessor
from lib.pricing_network import NetworkEstimator

# from sklearn.model_selection import train_test_split


"""
TODO: 
- Make fit_and_calibrate_classifier work - Done
- Do hyperparameter search
- Get decent results
- Write about them
- Make sure it works with LabTS [or the repo they gave us, see https://piazza.com/class/k0r3crncua81j6?cid=82]
"""


def load_model(load_path="part3_pricing_model.h5"):
    train_model()
    p_model = PricingModel()
    with open("part3_pricing_model_preprocessor.pickle", "rb") as target:
        p_model.preprocessor = pickle.load(target)

    with open("part3_needed_val.pickle", "rb") as target:
        values = pickle.load(target)

    p_model.load_model(load_path)

    model = CalibratedClassifierCV()
    fake_X = np.array([[1 for k in range(values["dim"])] for j in range(10)])
    fake_Y = np.array([0, 1, 0, 1, 0, 1, 0, 1, 0, 1])

    with open("part3_calibrated_pricing_model_cal_class.pickle", "rb") as target:
        list_cal = pickle.load(target)
        calibrated_classifiers_ = []
        for calibrators_ in list_cal:
            tmp = _CalibratedClassifier(base_estimator=p_model.base_classifier)
            tmp.fit(fake_X, fake_Y)
            tmp.calibrators_ = calibrators_
            calibrated_classifiers_.append(tmp)

    model.fit(fake_X, fake_Y)
    model.calibrated_classifiers_ = calibrated_classifiers_
    p_model.base_classifier = model
    p_model.y_mean = values["y_mean"]
    return p_model


def fit_and_calibrate_classifier(classifier, X, y, test_ratio=0.15, ones_ratio=0.5):
    X_train, y_train, X_cal, y_cal = helpers.split_dataset(X, y, test_ratio=test_ratio, ones_ratio=ones_ratio)
    classifier = classifier.fit(X_train, y_train)

    # This line does the calibration for you
    calibrated_classifier = CalibratedClassifierCV(classifier, method="sigmoid", cv="prefit").fit(X_cal, y_cal)
    return calibrated_classifier


# class for part 3
class PricingModel:
    # YOU ARE ALLOWED TO ADD MORE ARGUMENTS AS NECESSARY
    def __init__(self, calibrate_probabilities=False):
        """
        Feel free to alter this as you wish, adding instance variables as
        necessary.
        """
        self.y_mean = None
        self.calibrate = calibrate_probabilities
        # =============================================================
        # READ ONLY IF WANTING TO CALIBRATE
        # Place your base classifier here
        # NOTE: The base estimator must have:
        #    1. A .fit method that takes two arguments, X, y
        #    2. Either a .predict_proba method or a decision
        #       function method that returns classification scores
        #
        # Note that almost every classifier you can find has both.
        # If the one you wish to use does not then speak to one of the TAs
        #
        # If you wish to use the classifier in part 2, you will need
        # to implement a predict_proba for it before use
        # =============================================================

        ##################### HYPER-PARAMETERS #####################
        self.ones_ratio = 0.25  # Percentage of samples that are of class ones in batch and in test set
        self.steps_per_epoch = 1054  # Number of batch training iterations considered to be one epoch during training
        self.validation_steps = 186  # Number of batch training iterations considered to be one epoch during validation
        self.optimizer = "adam"  # Optimizer to train network
        self.loss = "binary_crossentropy"  # Loss to minimize
        self.metrics = ["accuracy", "AUC"]  # metrics of which to keep track during training and testing
        ###########################################################

        self.n_f = 0
        self.preprocessor = PricingModelPreprocessor()
        self.base_classifier = NetworkEstimator(
            optimizer=self.optimizer, loss=self.loss, metrics=self.metrics, ones_ratio=self.ones_ratio
        )

    # YOU ARE ALLOWED TO ADD MORE ARGUMENTS AS NECESSARY TO THE _preprocessor METHOD
    def _preprocessor(self, X_raw, fit=False):
        """Data preprocessing function.

        This function prepares the features of the data for training,
        evaluation, and prediction.

        Parameters
        ----------
        X_raw : ndarray
            An array, this is the raw data as downloaded

        Returns
        -------
        X: ndarray
            A clean data set that is used for training and prediction.
        """
        # =============================================================

        return self.preprocessor.transform(X_raw, fit=fit).toarray()
        # We should find a way to maintain the whole thing sparse throughout processing

    def fit(self, X_raw, y_raw, claims_raw):
        """Classifier training function.

        Here you will use the fit function for your classifier.

        Parameters
        ----------
        X_raw : ndarray
            This is the raw data as downloaded
        y_raw : ndarray
            A one dimensional array, this is the binary target variable
        claims_raw: ndarray
            A one dimensional array which records the severity of claims

        Returns
        -------
        self: (optional)
            an instance of the fitted model

        """
        self.y_mean = np.mean(claims_raw[claims_raw != 0])
        # =============================================================
        # REMEMBER TO A SIMILAR LINE TO THE FOLLOWING SOMEWHERE IN THE CODE
        X_clean = self._preprocessor(X_raw, fit=True)
        with open("part3_pricing_model_preprocessor.pickle", "wb") as target:
            pickle.dump(self.preprocessor, target)

        if not isinstance(y_raw, np.ndarray):
            y_raw = y_raw.values

        self.base_classifier.build_network(self.preprocessor.get_col_sizes())
        self.n_f = self.base_classifier.n_f

        # THE FOLLOWING GETS CALLED IF YOU WISH TO CALIBRATE YOUR PROBABILITIES
        if self.calibrate:
            self.base_classifier = fit_and_calibrate_classifier(self.base_classifier, X_clean, y_raw)
        else:
            self.base_classifier = self.base_classifier.fit(X_clean, y_raw)
        return self.base_classifier

    def predict_claim_probability(self, X_raw):
        """Classifier probability prediction function.

        Here you will implement the predict function for your classifier.

        Parameters
        ----------
        X_raw : ndarray
            This is the raw data as downloaded

        Returns
        -------
        ndarray
            A one dimensional array of the same length as the input with
            values corresponding to the probability of beloning to the
            POSITIVE class (that had accidents)
        """
        # =============================================================
        # REMEMBER TO A SIMILAR LINE TO THE FOLLOWING SOMEWHERE IN THE CODE
        # X_clean = self._preprocessor(X_raw)
        X_clean = self._preprocessor(X_raw)
        return self.base_classifier.predict_proba(X_clean)[:, 1]

    def predict_premium(self, X_raw):
        """Predicts premiums based on the pricing model.

        Here you will implement the predict function for your classifier.

        Parameters
        ----------
        X_raw : numpy.ndarray
            A numpy array, this is the raw data as downloaded

        Returns
        -------
        numpy.ndarray
            A one dimensional array of the same length as the input with
            values corresponding to the probability of belonging to the
            POSITIVE class (that had accidents)
        """
        # =============================================================
        # REMEMBER TO INCLUDE ANY PRICING STRATEGY HERE.
        # For example you could scale all your prices down by a factor

        return self.predict_claim_probability(X_raw) * self.y_mean

    def save_model(self, save_path="part3_pricing_model.h5"):
        with open("part3_pricing_model_preprocessor.pickle", "wb") as target:
            pickle.dump(self.preprocessor, target)
        self.base_classifier.save_model(save_path)

    def load_model(self, load_path="part3_pricing_model.h5"):
        self.base_classifier.build_network(self.preprocessor.get_col_sizes())
        self.base_classifier.load_model(load_path)


def train_model():
    data = pd.read_csv("data/part3_data.csv")
    data_features, claims_made, claim_amount = helpers.separate_labels(
        data, label_columns=["made_claim", "claim_amount"]
    )

    X_train, Y_train, X_test, Y_test, claim_amount_train = helpers.split_dataset_with_claim(
        data_features, claims_made, claim_amount, test_ratio=0.15, ones_ratio=0.5
    )

    pricing_model = PricingModel(calibrate_probabilities=True)
    pricing_model.fit(X_train, Y_train, claim_amount_train)
    dim = pricing_model.n_f
    predictions = pricing_model.predict_claim_probability(X_test)

    with open("part3_calibrated_pricing_model_cal_class.pickle", "wb") as target:
        topickle = [k.calibrators_ for k in pricing_model.base_classifier.calibrated_classifiers_]
        pickle.dump(topickle, target)

    with open("part3_needed_val.pickle", "wb") as target:
        topickle = {"y_mean": pricing_model.y_mean, "dim": dim}
        pickle.dump(topickle, target)
