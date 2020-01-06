import numpy as np
import matplotlib.pyplot as plt

# Constant definitions
B = np.matrix([[4, -2], [-2, 4]])
a = np.matrix([[0], [1]])
b = np.matrix([[-2], [1]])

C = np.matrix([[3, -2], [-2, 3]])
c = np.matrix([[-3 / 5], [-2 / 5]])
c0 = -0.6
I = np.matrix([[1, 0], [0, 1]])


# Question 3
def grad_f1(x):
    x = np.asmatrix(x).transpose()
    return (x - c).transpose() * (C.transpose() + C)


def grad_f2(x):
    x = np.asmatrix(x).transpose()
    return -2 * np.sin((x - b).transpose() * (x - b)) * (x - b).transpose() + (
        x - a
    ).transpose() * (B.transpose() + B)


def grad_f3(x):
    x = np.asmatrix(x).transpose()
    return -(
        np.exp(-(x - a).transpose() * (x - a)) * (-2 * (x - a).transpose())
        + np.exp(-(x - b).transpose() * B * (x - b))
        * (-(x - b).transpose() * (B + B.transpose()))
        - 1
        / 10
        * (
            1
            / np.linalg.det(1 / 100 * I + x * x.transpose())
            * 2
            / 100
            * x.transpose()
        )
    )


# Question 4
def grad_desc(grad, step, start, e):
    mn = start
    record = [np.asmatrix(mn)]
    for _ in range(step):
        mn -= e * grad(mn)
        record.append(np.copy(mn))
    return mn, record


###############################################################################
#                                                                             #
#                                                                             #
#   The code bellow is an example on how to use the gradient descent (plot)   #
#                                                                             #
#                                                                             #
###############################################################################

# Function definition
def f1(x):
    x = np.asmatrix(x)
    return (
        x.transpose() * B * x
        - x.transpose() * x
        + a.transpose() * x
        - b.transpose() * x
    )


def f2(x):
    x = np.asmatrix(x).transpose()
    return np.cos((x - b).transpose() * (x - b)) + (x - a).transpose() * B * (
        x - a
    )


def f3(x):
    x = np.asmatrix(x).transpose()
    return 1 - (
        np.exp(-(x - a).transpose() * (x - a))
        + np.exp(-(x - b).transpose() * B * (x - b))
        - 1 / 10 * np.log(np.linalg.det(1 / 100 * I + x * x.transpose()))
    )


# Example to use the code
if __name__ == "__main__":
    # Definition of starting point and learning rate
    st = [0.3, 0]
    learning_rate = 0.02

    # Getting the last point from gradient descent and the all the points
    gdsesc_2 = grad_desc(grad_f2, 50, st, learning_rate)
    last_point = tuple(gdsesc_2[0].tolist()[0])
    gdsesc_2 = list(map(lambda l: tuple(l.tolist()[0]), gdsesc_2[1]))

    # Ploting the gradient
    fig, ax = plt.subplots(figsize=(15, 10))
    x1 = np.linspace(-1, 1, 100)
    x2 = np.linspace(-0.25, 1.75, 100)
    X1, X2 = np.meshgrid(x1, x2)

    Z = [[[a, b] for a in x1] for b in x2]
    results = np.asarray(
        list(
            map(
                lambda l: np.asarray(list(map(lambda v: np.double(f2(v)), l))),
                Z,
            )
        )
    )
    ax.plot(
        *zip(*gdsesc_2),
        marker="x",
        label="Points obtained through gradient descent",
    )
    ax.plot(
        last_point[0],
        last_point[1],
        marker="o",
        color="red",
        label="last point",
    )

    plt.contour(X1, X2, results, 50, colors="black")
    ax.set_xlabel("x")
    ax.set_ylabel("y")
    ax.set_title(
        (
            f"Contour plot with gradient descent of f2"
            f" and step size of {learning_rate}"
        )
    )
    ax.legend()

    plt.show()
