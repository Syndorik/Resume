from paths import check_path
from lib.Agent_bellman import Agent
from lib.DQN_t_bellman import DQN
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
    CID = 797836
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

    # Create a DQN (Deep Q-Network)
    lr = 0.001
    gamma = 0.9
    verbose = True

    # Loop over episodes

    # Reset the environment for the start of the episode.

    n_iteration = 500
    n_step = 20
    batch_size = 50
    delta = [0, 0.01, 0.08, 0.2, 1]  # 0.08

    y = []

    # Loop over steps within this episode. The episode length here is 20.
    print(delta)
    for d in delta:
        print(f"delta = {d}")
        agent = Agent(environment)
        agent.reset()
        ReplayBuffer.reset()
        dqn = DQN(lr=lr, gamma=gamma, verbose=verbose)

        for k in range(n_iteration // n_step):
            dqn.update_target()
            agent.reset()

            for _ in range(n_step):
                best_action = dqn.get_best_action(agent.state)
                transition = agent.step(action=best_action, delta=d)
                if len(ReplayBuffer.deque) < batch_size:
                    ReplayBuffer.deque.append(transition)

                else:
                    ReplayBuffer.deque.append(transition)
                    loss = dqn.train_q_network(transition)

        # Checking the greedy to sum reward
        sum_reward = 0
        agent.reset()
        for j in range(n_step):
            action_to_take = dqn.get_best_action(agent.state)
            transition = agent.step(action=action_to_take, greedy=True)
            sum_reward += transition[2]
        y.append(sum_reward)

    fig = plt.figure(figsize=(15, 10))
    ax1 = plt.subplot(1, 1, 1)

    ax1.plot(delta, y, marker="x")
    ax1.set_xlabel("Delta")
    ax1.set_ylabel("reward_sum")
    plt.title(
        (
            f"Total reward according to delta changes in epsilon greedy policy"
            f" with a target network and"
            f" steps {n_step} and {n_iteration}"
            f" iterations with batch size = {batch_size}"
            f" learning rate = {lr}"
            f" discount factor = {gamma}"
        )
    )

    plt.savefig("../template/delta_th")
    plt.show()
