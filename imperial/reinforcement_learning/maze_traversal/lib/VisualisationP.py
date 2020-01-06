import numpy as np
import cv2

# [state, action, reward, next state]


class VisualizationP(object):
    states = [
        (
            np.float32(round(k / 10 + 0.05, 2)),
            np.float32(round(j / 10 + 0.05, 2)),
        )
        for k in range(10)
        for j in range(10)
    ]

    def __init__(self, path, x=700, verbose=False):
        self.path = path
        self.x = x
        self.y = x
        self.image = np.zeros([x, x, 3], dtype=np.uint8)
        self.x_scale = int(self.x / 10)
        self.y_scale = int(self.y / 10)
        self.state_to_coord = {}
        self.verbose = verbose

        for k in VisualizationP.states:
            self.state_to_coord[k] = (
                round((k[0] - 0.05) * 10),  # x values
                round((1 - k[1] - 0.05) * 10),  # y values
            )

        # Get colors
        q_values = [path[k][1] for k in range(len(path))]
        self.q_min = np.min(q_values)
        self.q_max = np.max(q_values)

        # Init and goal
        # Set the initial state of the agent
        self.init_state = (np.float32(0.15), np.float32(0.15))
        # Set the initial state of the goal
        self.goal_state = (np.float32(0.75), np.float32(0.85))

        self.print(f"\n\nstate to coord : {self.state_to_coord}")

    def plot_Path(self, state_1, state_2):
        coord_1 = self.state_to_coord[state_1[0]]
        coord_2 = self.state_to_coord[state_2[0]]
        q_val_1 = state_1[1]

        coord_1 = (coord_1[0] * self.x_scale, coord_1[1] * self.y_scale)
        coord_2 = (coord_2[0] * self.x_scale, coord_2[1] * self.y_scale)

        center_1 = (
            int(coord_1[0] + self.x_scale / 2),
            int(coord_1[1] + self.y_scale / 2),
        )

        center_2 = (
            int(coord_2[0] + self.x_scale / 2),
            int(coord_2[1] + self.y_scale / 2),
        )

        color_1 = self.colors_corr(q_val_1)

        self.plot_line(center_1, center_2, color_1)

        self.print("\n\n\n")

        pass

    def interpolate_col(self, fraction):
        B = 0
        G = 255 * fraction
        R = 255 * (1 - fraction)
        return (B, G, R)

    def colors_corr(self, q_value):
        self.print(
            f"fraction {(q_value - self.q_min) / (self.q_max - self.q_min)}"
        )
        self.print(f"q_value = {q_value}")

        color = self.interpolate_col(
            (q_value - self.q_min) / (self.q_max - self.q_min)
        )
        return color

    def plot_line(self, coord_1, coord_2, line_color):
        thickness = 10  # px
        cv2.line(self.image, coord_1, coord_2, line_color, thickness=thickness)

    def plot_lines(self):
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

    def plot_circle(self, state, radius, color):
        coord = self.state_to_coord[state]
        coord = (coord[0] * self.x_scale, coord[1] * self.y_scale)
        center = (
            int(coord[0] + self.x_scale / 2),
            int(coord[1] + self.y_scale / 2),
        )
        cv2.circle(self.image, center, radius, color, cv2.FILLED)

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
        self.print(f"\n\nPath : {self.path}")
        for k in range(len(self.path) - 1):
            self.plot_Path(self.path[k], self.path[k + 1])
            last = self.path[k + 1][0]

        # Plot lines
        self.plot_lines()

        # Plot start and goal circles
        R = (0, 0, 255)
        G = (0, 255, 0)
        radius = int(0.02 * self.x)
        self.plot_circle(self.init_state, radius, R)
        self.plot_circle(self.goal_state, radius, (255, 255, 255))
        self.plot_circle(last, radius, G)

        cv2.imshow("Visualization", self.image)
        cv2.waitKey(100000)

    def save(self, path):
        cv2.imwrite(path, self.image)

    def print(self, msg):
        if self.verbose:
            print(msg)


if __name__ == "__main__":
    viz = VisualizationP("tutu")
    viz.draw()

    pass
