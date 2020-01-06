# Imports

import numpy as np

# Question 2a


def lml(alpha, beta, Phi, Y):
    C = alpha * Phi * Phi.T + beta * np.identity(N)
    return (
        -1
        / 2
        * (
            N * np.log(2 * np.pi)
            + np.log(np.linalg.det(C))
            + (Y.T * np.linalg.inv(C) * Y)
        )
    )


def grad_lml(alpha, beta, Phi, Y):
    C = alpha * Phi * Phi.T + beta * np.identity(N)
    d_1 = -(
        1 / 2 * np.trace(np.linalg.inv(C) * Phi * Phi.T)
        - 1 / 2 * Y.T * np.linalg.inv(C) * Phi * Phi.T * np.linalg.inv(C) * Y
    )
    d_2 = -(
        1 / 2 * np.trace(np.linalg.inv(C))
        - 1 / 2 * Y.T * np.linalg.inv(C) * np.linalg.inv(C) * Y
    )
    return np.asmatrix([float(d_1), float(d_2)])


def grad_desc(grad, step, e, start, *argv):
    mn = np.asmatrix(start)
    record = [np.copy(mn)]
    for _ in range(step):
        mn += e * grad(mn[0, 0], mn[0, 1], *argv)
        if mn[0, 1] < 0:
            mn[0, 1] = record[-1][0, 1]
            e /= 100
        record.append(np.copy(mn))
    return mn, record


# -----------------------------END CODE SUBMISSION ----------------------------
# ------------------------ Code used in other questions -----------------------

# Data
N = 25
X_d = np.reshape(np.linspace(0, 0.9, N), (N, 1))
Y_d = np.cos(10 * X_d ** 2) + 0.1 * np.sin(100 * X_d)


# Polynomial basis
def poly(x, j):
    return x ** j


v_poly = np.vectorize(poly)


# Trigonometric basis
def trig(x, j):
    if not isinstance(x, float):
        x = x[0]

    toret = []
    for k in range(1, j + 1):
        toret.append(np.sin(2 * np.pi * k * x))
        toret.append(np.cos(2 * np.pi * k * x))
    return np.array([1] + toret)


# gaussian basis
def gauss(x, u, sig):
    return np.exp(-(x - u) ** 2 / (2 * sig ** 2))


def gauss_unbiased(x, u, sig):
    if not isinstance(x, float):
        x = x[0]

    if not isinstance(sig, float):
        sig = sig[0]

    toret = []
    for k in u:
        toret.append(np.exp(-(x - k) ** 2 / (2 * sig ** 2)))
    return np.array([1] + toret)


v_gauss = np.vectorize(gauss)


# Question 1 a helpers
def get_phi(x, v_func, *argv):
    return np.matrix([v_func(k, *argv) for k in x])


def w_pred(x, y, v_func, *argv):
    phi = get_phi(x, v_func, *argv)
    return np.linalg.inv(phi.T * phi) * phi.T * y


def get_pred(minn, maxx, v_func, *argv):
    w = w_pred(X_d, Y_d, v_func, *argv)
    x = np.linspace(minn, maxx, 200)
    phi = get_phi(x, v_func, *argv)
    y = phi * w
    return x, y


# Cross Validation
def get_test_train(k):
    x_train = X_d[X_d != X_d[k]]
    x_test = X_d[k]
    y_train = Y_d[Y_d != Y_d[k]]
    y_test = Y_d[k]
    return (
        np.reshape(x_train, (len(x_train), 1)),
        np.reshape(x_test, (len(x_test), 1)),
        np.reshape(y_train, (len(y_train), 1)),
        np.reshape(y_test, (len(y_test), 1)),
    )


class Model:
    def __init__(self, X, Y, v_func, *argv):
        self.v_func = v_func
        self.argv = argv
        self.X = X
        self.Y = Y
        self.error_test = []
        self.error_train = []

        for k in range(len(X)):
            x_tr, x_te, y_tr, y_te = get_test_train(k)
            self.set_error(x_tr, x_te, y_tr, y_te)

    def set_error(self, x_train, x_test, y_train, y_test):
        w = w_pred(x_train, y_train, self.v_func, *self.argv)
        self.get_error_test(x_test, y_test, w)
        self.get_error_train(x_train, y_train, w)

    def fit(self, x, w):
        phi = get_phi(x, self.v_func, *self.argv)
        y = phi * w
        return y

    def get_error_test(self, x_test, y_test, w):
        y_pred = float(self.fit(x_test, w))
        self.error_test.append(((y_pred - float(y_test)) ** 2))

    def get_error_train(self, x_train, y_train, w):
        y_pred = self.fit(x_train, w)
        self.error_train.append(np.mean((np.asarray(y_train - y_pred) ** 2)))


errors_test = []
errors_train = []
for k in range(11):
    lm = Model(X_d, Y_d, trig, k)
    errors_test.append(np.mean(lm.error_test))
    errors_train.append(np.mean(lm.error_train))
