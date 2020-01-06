from paths import check_path
from lib.Agent import Agent
from lib.DQN_reward import DQN
from lib.environment import Environment

import torch
import numpy as np
from lib.ReplayBuffer import ReplayBuffer
import matplotlib.pyplot as plt

# Main entry point
if __name__ == "__main__":
    check_path()
    # Set the random seed for both NumPy and Torch
    # You should leave this as 0, for consistency across different runs
    # (Deep Reinforcement Learning is highly sensitive to different random
    # seeds, so keeping this the same throughout will help you debug your
    # code).
    CID = 1797836
    np.random.seed(CID)
    torch.manual_seed(CID)

    # Create an environment.
    # If display is True, then the environment will be displayed after every
    # agent step. This can be set to False to speed up training time.
    # The evaluation in part 2 of the coursework will be done based on the
    # time with display=False.
    # Magnification determines how big the window will be when displaying the
    # environment on your monitor. For desktop PCs, a value of 1000 should be
    # about right. For laptops, a value of 500 should be about right. Note that
    # this value does not affect the underlying state space or the learning,
    # just the visualisation of the environment.
    environment = Environment(display=False, magnification=1000)

    # Create an agent
    agent = Agent(environment)

    # Create a DQN (Deep Q-Network)
    lr = 0.001
    verbose = False
    dqn = DQN(lr=lr, verbose=verbose)

    # Loop over episodes

    # Reset the environment for the start of the episode.
    agent.reset()

    n_iteration = 500
    n_step = 20
    batch_size = 50
    y = []
    x = list(range(n_iteration))

    # Loop over steps within this episode. The episode length here is 20.
    for _ in range(n_iteration // n_step):
        agent.reset()
        for _ in range(n_step):
            if len(ReplayBuffer.deque) < batch_size:
                transition = agent.step()
                ReplayBuffer.deque.append(transition)
                y.append(0)
            else:
                transition = agent.step()
                ReplayBuffer.deque.append(transition)
                loss = dqn.train_q_network(transition, online=False)
                y.append(loss)

    fig = plt.figure(figsize=(15, 10))
    ax1 = plt.subplot(1, 1, 1)

    ax1.plot(x, y)
    ax1.set_xlabel("Number of steps")
    ax1.set_ylabel("Loss function")
    plt.title(
        (
            f"Loss function (reward) over the number"
            f" of steps {n_step} and {n_iteration}"
            f" iterations with batch size = {batch_size}"
            f" learning rate = {lr}"
        )
    )

    # smooth_term = 15
    # ax1.plot(
    #     list(range(smooth_term, len(x) - smooth_term)),
    #     [
    #         np.mean(y[k - smooth_term : k + smooth_term])
    #         for k in list(range(smooth_term, len(x) - smooth_term))
    #     ],
    # )

    plt.yscale("log")
    plt.savefig("../template/batch")
    plt.show()
