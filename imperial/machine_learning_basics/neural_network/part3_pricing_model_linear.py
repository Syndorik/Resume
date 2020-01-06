import pickle

import numpy as np
import pandas as pd
from sklearn.calibration import CalibratedClassifierCV
from sklearn.linear_model import LogisticRegression

from lib import helpers
from lib.pricing_model_preprocessor import PricingModelPreprocessor

# from sklearn.model_selection import train_test_split


"""
TODO: 
- Make fit_and_calibrate_classifier work - Done
- Do hyperparameter search
- Get decent results
- Write about them
- Make sure it works with LabTS [or the repo they gave us, see https://piazza.com/class/k0r3crncua81j6?cid=82]
"""


def load_model_linear(loadpath="part3_linear_model.pickle"):
    train_model()
    model = None
    with open("part3_linear_model.pickle", "rb") as target:
        print("loading linmodel")
        model = pickle.load(target)

    return model


def fit_and_calibrate_classifier(classifier, X, y, test_ratio=0.15, ones_ratio=0.5):
    X_train, y_train, X_cal, y_cal = helpers.split_dataset(X, y, test_ratio=test_ratio, ones_ratio=ones_ratio)
    classifier = classifier.fit(X_train, y_train)

    # This line does the calibration for you
    calibrated_classifier = CalibratedClassifierCV(classifier, method="sigmoid", cv="prefit").fit(X_cal, y_cal)
    return calibrated_classifier


# class for part 3
class PricingModelLinear:
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
        self.metrics = ["accuracy", "AUC"]  # metrics of which to keep track during training and testing
        ###########################################################

        self.preprocessor = PricingModelPreprocessor()
        self.base_classifier = LogisticRegression()

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

        return self.preprocessor.transform(X_raw, fit=fit).toarray()  # Had to put this `toarray()` here temporarily
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

        if not isinstance(y_raw, np.ndarray):
            y_raw = y_raw.values

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
        return self.predict_claim_probability(X_raw) * self.y_mean * 1.20

    def save_model(self):
        """Saves the class instance as a pickle file."""
        # =============================================================
        with open("part3_pricing_model.pickle", "wb") as target:
            pickle.dump(self, target)


def train_model():
    data = pd.read_csv("data/part3_data.csv")
    data_features, claims_made, claim_amount = helpers.separate_labels(
        data, label_columns=["made_claim", "claim_amount"]
    )

    X_train, Y_train, X_test, Y_test, claim_amount_train = helpers.split_dataset_with_claim(
        data_features, claims_made, claim_amount, test_ratio=0.15, ones_ratio=0.5
    )

    print("Starting Lin Model")
    pricing_model_lin = PricingModelLinear(calibrate_probabilities=True)
    pricing_model_lin.fit(X_train, Y_train, claim_amount_train)
    predictions = pricing_model_lin.predict_claim_probability(X_test)

    with open("part3_linear_model.pickle", "wb") as target:
        pickle.dump(pricing_model_lin, target)
