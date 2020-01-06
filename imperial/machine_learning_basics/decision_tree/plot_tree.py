import matplotlib.patches as patches
import matplotlib.pyplot as plt
import numpy as np


def calc_img_dimensions(
    node,
    outer_padding,
    node_padding_x,
    node_padding_y,
    node_box_width,
    node_box_height,
):
    tree_height = node.max_height()
    num_final_level = len(node.get_leaves())
    img_height = (
        2 * outer_padding
        + (tree_height - 1) * node_padding_y
        + tree_height * node_box_height
    )
    img_width = (
        2 * outer_padding
        + 3 * (num_final_level - 1) * node_padding_x
        + num_final_level * node_box_width
    )
    return img_height, img_width


def draw_node(
    node,
    center,
    ax,
    node_box_width,
    node_box_height,
    linewidth=1,
    edgecolor="k",
    facecolor="none",
    leaf_edgecolor=(1.0, 0.5, 0.5),
    leaf_facecolor=(1.0, 0.8, 0.8),
):
    label = (
        f"Room {node.room}"
        if node.room is not None
        else f"A{node.split.attrIndex} < {node.split.lessThan}"
    )
    edgecolor = leaf_edgecolor if node.room is not None else edgecolor
    facecolor = leaf_facecolor if node.room is not None else facecolor
    rect = patches.Rectangle(
        (center[0] - node_box_width // 2, center[1] - node_box_height // 2),
        node_box_width,
        node_box_height,
        linewidth=linewidth,
        edgecolor=edgecolor,
        facecolor=facecolor,
    )
    ax.add_patch(rect)
    ax.text(center[0], center[1], label, size=10, ha="center", va="center")


#     ax.text(center[0], center[1], label, size=10,
#          ha="center", va="center",
#          bbox=dict(boxstyle="round",
#                    ec=(1., 0.5, 0.5),
#                    fc=(1., 0.8, 0.8),
#                    )
#          )
#     if node.room is not None:
#         ax.axvline(center[0],color='k',linestyle='solid')
#     ax.axhline(center[1],color='k',linestyle='solid')


def draw_nodes(
    node,
    center_y,
    img_dims,
    ax,
    leaves,
    node_padding_y,
    node_box_width,
    node_box_height,
):
    if node.room is not None:
        next_centers_x = np.array(
            [
                (int((i + 1) / (len(leaves) + 1) * img_dims[1]), leaf)
                for i, leaf in enumerate(leaves)
            ]
        )
        next_center_x = None
        for center_x, candidate in next_centers_x:
            if candidate is node:
                next_center_x = center_x
        if next_center_x is None:
            raise ValueError("Something's not right")
    else:
        # Calculate new Y component of centers for left and right branches of
        # the tree
        next_center_y = center_y + node_box_height + node_padding_y

        # Recursively draw next nodes
        left_center = draw_nodes(
            node.left,
            next_center_y,
            img_dims,
            ax,
            leaves,
            node_padding_y,
            node_box_width,
            node_box_height,
        )
        right_center = draw_nodes(
            node.right,
            next_center_y,
            img_dims,
            ax,
            leaves,
            node_padding_y,
            node_box_width,
            node_box_height,
        )
        next_center_x = (left_center + right_center) // 2

        # Draw arrows
        ax.arrow(
            next_center_x,
            center_y + node_box_height // 2,
            left_center - next_center_x,
            node_padding_y - 1,
        )  # Left
        ax.arrow(
            next_center_x,
            center_y + node_box_height // 2,
            right_center - next_center_x,
            node_padding_y - 1,
        )  # Right

    draw_node(
        node, (next_center_x, center_y), ax, node_box_width, node_box_height
    )
    return next_center_x


def plot_tree(
    node,
    *,
    save_path="",
    figsize=(30, 8),
    outer_padding=10,
    node_padding_x=5,
    node_padding_y=25,
    node_box_width=150,
    node_box_height=50,
):
    dims = calc_img_dimensions(
        node,
        outer_padding,
        node_padding_x,
        node_padding_y,
        node_box_width,
        node_box_height,
    )
    canvas = np.ones(dims)

    # Setup canvas
    fig = plt.figure(figsize=figsize)
    ax = fig.subplots(1)
    ax.imshow(canvas, cmap="gray_r")

    # Draw rectangle for nodes
    center = (canvas.shape[1] // 2, outer_padding + node_box_height // 2)
    leaves = node.get_leaves()
    draw_nodes(
        node,
        center[1],
        dims,
        ax,
        leaves,
        node_padding_y,
        node_box_width,
        node_box_height,
    )
    if save_path:
        plt.savefig(save_path, bbox_inches='tight')
    else:
        plt.show()
