import numpy as np
import tensorflow as tf
from sklearn.base import BaseEstimator

from lib import helpers


class PricingNetwork(tf.keras.Model):
    def __init__(self, col_sizes):
        super(PricingNetwork, self).__init__()
        self.n_f = 0
        self.col_sizes = col_sizes

        self.dense1v = tf.keras.layers.Dense(20, activation=tf.nn.relu, input_shape=(len(col_sizes["vehicle"]),))
        self.dense1p = tf.keras.layers.Dense(20, activation=tf.nn.relu, input_shape=(len(col_sizes["policy"]),))
        self.dense1d = tf.keras.layers.Dense(20, activation=tf.nn.relu, input_shape=(len(col_sizes["driver"]),))
        self.dense1l = tf.keras.layers.Dense(20, activation=tf.nn.relu, input_shape=(len(col_sizes["location"]),))

        total_size = sum(len(i) for i in col_sizes.values())
        self.dense2 = tf.keras.layers.Dense(100, activation=tf.nn.relu, input_shape=(total_size,))
        self.dense3 = tf.keras.layers.Dense(50, activation=tf.nn.relu)
        self.dense4 = tf.keras.layers.Dense(10, activation=tf.nn.relu)

        self.dense_output = tf.keras.layers.Dense(1, activation=tf.nn.sigmoid)

    def call(self, inputs):
        c = self.col_sizes
        inputs_v = inputs[c["vehicle"].start : c["vehicle"].stop]
        inputs_p = inputs[c["policy"].start : c["policy"].stop]
        inputs_d = inputs[c["driver"].start : c["driver"].stop]
        inputs_l = inputs[c["location"].start : c["location"].stop]

        outputs_v = self.dense1v(inputs_v)
        outputs_p = self.dense1p(inputs_p)
        outputs_d = self.dense1d(inputs_d)
        outputs_l = self.dense1l(inputs_l)

        inputs_for_layer2 = tf.concat([outputs_v, outputs_p, outputs_d, outputs_l], axis=0)
        outputs_2 = self.dense2(inputs_for_layer2)
        outputs_3 = self.dense3(outputs_2)
        outputs_4 = self.dense4(outputs_3)

        return self.dense_output(outputs_4)


class NetworkEstimator(BaseEstimator):
    def __init__(
        self,
        *,
        col_sizes=None,
        optimizer="adam",
        loss="binary_crossentropy",
        metrics=("accuracy", "AUC"),
        ones_ratio=0.5,
        steps_per_epoch=1054,
        validation_steps=186
    ):
        self.col_sizes = col_sizes
        self.optimizer = optimizer
        self.metrics = list(metrics)
        self.loss = loss
        self.network = None
        self.ones_ratio = ones_ratio
        self.steps_per_epoch = steps_per_epoch
        self.validation_steps = validation_steps
        self.classes_ = [0, 1]

        if self.col_sizes is not None:
            self.build_network()

        self.callbacks = [
            tf.keras.callbacks.ModelCheckpoint(
                "part3_pricing_model.h5", save_best_only=True, monitor="val_AUC", mode="min", save_weights_only=True
            ),
            tf.keras.callbacks.ReduceLROnPlateau(
                monitor="val_loss", factor=0.1, patience=7, verbose=1, epsilon=1e-4, mode="min"
            ),
        ]

    def build_network(self, col_sizes=None):
        self.col_sizes = col_sizes if col_sizes is not None else self.col_sizes
        if self.col_sizes is None:
            raise ValueError("Argument `col_sizes` can't be `None`")
        self.network = PricingNetwork(self.col_sizes)
        self.network.compile(optimizer=self.optimizer, loss=self.loss, metrics=self.metrics)
        self.n_f = self.col_sizes["location"][-1] + 1
        self.network.build(input_shape=(1, self.n_f))

    def fit(self, X_clean, y_raw):
        X_train, Y_train, X_validation, Y_validation = helpers.split_dataset(X_clean, y_raw, ones_ratio=self.ones_ratio)
        train_generator = helpers.iml_generator(X_train, Y_train)
        validation_generator = helpers.iml_generator(X_validation, Y_validation)
        self.network.fit_generator(
            generator=train_generator,
            validation_data=validation_generator,
            epochs=10,
            steps_per_epoch=self.steps_per_epoch,
            validation_steps=self.validation_steps,
            callbacks=self.callbacks,
        )

        return self

    def predict_proba(self, X):
        raw_predictions = self.network.predict(X)
        return np.concatenate([1 - raw_predictions, raw_predictions], axis=1)

    def save_model(self, save_path="part3_pricing_model.h5"):
        self.network.save_weights(save_path)

    def load_model(self, load_path="part3_pricing_model.h5"):
        self.network.load_weights(load_path)
