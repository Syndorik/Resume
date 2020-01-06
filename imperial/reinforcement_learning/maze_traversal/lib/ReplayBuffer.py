import collections
import numpy as np


class ReplayBuffer(object):
    CID = 797836
    np.random.seed(CID)
    deque = collections.deque(maxlen=1000000)

    @classmethod
    def get_batch(cls, batch_size=50):
        list_indices = list(
            np.random.randint(0, len(ReplayBuffer.deque), batch_size)
        )
        return [cls.deque[k] for k in list_indices]

    @classmethod
    def reset(cls):
        cls.deque = collections.deque(maxlen=1000000)
