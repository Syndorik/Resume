import numpy as np
import cv2

# [state, action, reward, next state]


class VisualizationQ(object):
    states = [
        (k / 10 + 0.05, j / 10 + 0.05) for k in range(10) for j in range(10)
    ]

    def __init__(self, model, x=700, verbose=False):
        self.model = model
        self.x = x
        self.y = x
        self.image = np.zeros([x, x, 3], dtype=np.uint8)
        self.x_scale = int(self.x / 10)
        self.y_scale = int(self.y / 10)
        self.state_to_coord = {}
        self.verbose = verbose

        for k in VisualizationQ.states:
            self.state_to_coord[k] = (
                round((k[0] - 0.05) * 10),  # x values
                round((1 - k[1] - 0.05) * 10),  # y values
            )
        self.print(self.state_to_coord)

    def plot_Q(self, state):
        coord = self.state_to_coord[state]
        self.print(f"coord {coord} state {state}")
        # coord = state

        coord = (coord[0] * self.x_scale, coord[1] * self.y_scale)
        top_left = coord
        bot_left = (coord[0], coord[1] + self.y_scale)
        top_right = (coord[0] + self.x_scale, coord[1])
        bot_right = (coord[0] + self.x_scale, coord[1] + self.y_scale)
        center = (
            int(coord[0] + self.x_scale / 2),
            int(coord[1] + self.y_scale / 2),
        )

        colors = self.colors_corr(self.model.predict(state))
        # colors = [(255.0, 0.0, 0.0), (0, 0, 0), (0, 0, 0), (0, 0, 0)]

        # Right
        self.fill_triange([top_right, bot_right, center], colors[0])

        # Down
        self.fill_triange([bot_left, bot_right, center], colors[1])

        # Left
        self.fill_triange([top_left, bot_left, center], colors[2])

        # Up
        self.fill_triange([top_left, top_right, center], colors[3])

        self.print("\n\n\n")

        pass

    def interpolate_col(self, fraction):
        B = 255 * (1 - fraction)
        G = 255 * fraction
        R = 255 * fraction
        return (B, G, R)

    def colors_corr(self, q_values):
        q_min = np.min(q_values)
        q_max = np.max(q_values)
        colors = []

        for k in range(len(q_values)):
            self.print(f"fraction {(q_values[k] - q_min) / (q_max - q_min)}")
            self.print(f"k = {k} q_values[k] = {q_values[k]}")
            self.print(
                f"col = {self.interpolate_col((q_values[k] - q_min) / (q_max - q_min))}"
            )
            colors.append(
                self.interpolate_col((q_values[k] - q_min) / (q_max - q_min))
            )
        return colors

    def plot_line(self):
        line_color = (255, 255, 255)
        thickness = 4  # px
        for k in range(0, self.y, self.y_scale):
            cv2.line(
                self.image,
                (0, k),
                (self.y - 1, k),
                line_color,
                thickness=thickness,
            )

        cv2.line(
            self.image,
            (0, self.y - 1),
            (self.y - 1, self.y - 1),
            line_color,
            thickness=thickness,
        )

        for k in range(0, self.x, self.x_scale):
            cv2.line(
                self.image,
                (k, 0),
                (k, self.x - 1),
                line_color,
                thickness=thickness,
            )

        cv2.line(
            self.image,
            (self.x - 1, 0),
            (self.x - 1, self.x - 1),
            line_color,
            thickness=thickness,
        )

    def plot_triangle(self, coord):
        line_color = (0, 0, 0)
        thickness = 4  # px
        cv2.polylines(
            self.image,
            [np.array(coord)],
            True,
            line_color,
            thickness=thickness,
        )

    def fill_triange(self, coord, color):
        cv2.fillConvexPoly(self.image, np.array(coord), color)
        self.plot_triangle(coord)

    def draw(self):
        # self.plot_Q((9, 0))
        for k in self.states:
            self.plot_Q(k)
        self.plot_line()
        cv2.imshow("Visualization", self.image)
        cv2.waitKey(100000)

    def save(self, path):
        cv2.imwrite(path, self.image)

    def print(self, msg):
        if self.verbose:
            print(msg)


if __name__ == "__main__":
    viz = VisualizationQ("tutu")
    viz.draw()

    pass
