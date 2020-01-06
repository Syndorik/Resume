class Split(object):
    """
    If the datapoint's attribute [attrIndex] is less than [lessThan], go left.
    Otherwise, go right.
    """

    def __init__(self, attr_index, less_than):
        self.attrIndex = attr_index
        self.lessThan = less_than

    def divide_dataset(self, dataset):
        """
        Divides a dataset using this split
        Args:
            dataset: The dataset to divide

        Returns: a tuple (left, right) with the left and right datasets

        """
        left_mask = dataset[:, self.attrIndex] < self.lessThan
        left_dataset = dataset[left_mask]
        right_dataset = dataset[~left_mask]
        return (left_dataset, right_dataset)


class Node(object):
    def __init__(
        self,
        left: "Node" = None,
        right: "Node" = None,
        room: int = None,
        split: Split = None,
    ):
        if room is None and split is None:
            raise ValueError(
                (
                    "A leaf node must have a room, and a stem"
                    "node must have a split"
                )
            )
        self.left = left
        self.right = right
        self.room = room
        self.split = split

    @property
    def room(self):
        return self._room

    @room.setter
    def room(self, value):
        if value is None:
            self._room = None
        else:
            self.left = None
            self.right = None
            self.split = None
            self._room = int(value)

    def max_height(self):
        if self.room is not None:
            return 1
        return 1 + max(self.left.max_height(), self.right.max_height())

    def avg_height(self):
        if self.room is not None:
            return 1
        return 1 + (self.left.avg_height() + self.right.avg_height()) / 2

    def get_leaves(self):
        if self.room is not None:
            return [self]
        return self.left.get_leaves() + self.right.get_leaves()

    def predict(self, dataset):
        return [self.predict_sample(row) for row in dataset]

    def predict_sample(self, sample):
        """
        Predicts the class of a single sample
        """
        if self.room is not None:
            return self.room
        if sample[self.split.attrIndex] < self.split.lessThan:
            return self.left.predict_sample(sample)
        return self.right.predict_sample(sample)
