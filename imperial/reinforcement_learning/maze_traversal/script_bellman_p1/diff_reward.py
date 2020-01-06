from paths import check_path
from lib.Agent_bellman import Agent
from lib.DQN_t_bellman import DQN
from lib.environment import Environment
from lib.VisualisationP import VisualizationP


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

    # Reset the environment for the start of the episode.

    n_iteration = 500
    n_step = 20
    batch_size = 50
    delta = 0.2

    y_greed = []
    y_dic = {}

    def r_mix_squared_atan(d):
        if d >= 0.5:
            return r_atan(d)
        else:
            return r_2(d)

    def r_neg(d):
        if d >= 0.06:
            return -1
        else:
            return 100

    def r_d2(d):
        return 1 - d ** 2

    def r_d3(d):
        return 1 - d ** 3

    def r_d4(d):
        return 1 - d ** 4

    def r_3(d):
        return (1 - d) ** 3

    def r_4(d):
        return (1 - d) ** 4

    def r_2(d):
        return (1 - d) ** 2

    def r_inverse(d):
        return 1 / (d + 1e-8)

    def r_atan(d):
        return 1 / (np.arctan(d + 1e-8))

    list_rfun = [
        # r_mix_squared_atan,
        # r_neg,
        # r_d2,
        r_d3
        # r_d4,
        # r_2,
        # r_3,
        # r_4,
        # r_inverse,
        # r_atan,
    ]

    # Normal one
    agent = Agent(environment)
    agent.reset()
    agent_greedy = Agent(environment)
    agent_greedy.reset()
    ReplayBuffer.reset()
    dqn = DQN(lr=lr, gamma=gamma, verbose=verbose)
    for k in range(n_iteration // n_step):
        dqn.update_target()
        agent.reset()

        for _ in range(n_step):
            best_action = dqn.get_best_action(agent.state)
            transition = agent.step(
                action=best_action, delta=delta, r_fun=None
            )
            if len(ReplayBuffer.deque) < batch_size:
                ReplayBuffer.deque.append(transition)

            else:
                ReplayBuffer.deque.append(transition)
                loss = dqn.train_q_network(transition)

            # Checking the greedy distance to goal
            agent_greedy.reset()
            goals = []
            for j in range(n_step):
                action_to_take = dqn.get_best_action(agent_greedy.state)
                transition = agent_greedy.step(
                    action=action_to_take, greedy=True, r_fun=None
                )
                goals.append(agent_greedy.distance_to_goal)
            y_greed.append(min(goals))

    # TEST WITH OTHER FUNCTIONS

    # Loop over steps within this episode. The episode length here is 20.
    for r_fun in list_rfun:
        y = []
        print(f"Testing with : {r_fun.__name__}")
        agent = Agent(environment)
        agent.reset()
        agent_greedy = Agent(environment)
        agent_greedy.reset()
        ReplayBuffer.reset()
        dqn = DQN(lr=lr, gamma=gamma, verbose=verbose)
        for k in range(n_iteration // n_step):
            dqn.update_target()
            agent.reset()

            for _ in range(n_step):
                best_action = dqn.get_best_action(agent.state)
                transition = agent.step(
                    action=best_action, delta=delta, r_fun=r_fun
                )
                if len(ReplayBuffer.deque) < batch_size:
                    ReplayBuffer.deque.append(transition)

                else:
                    ReplayBuffer.deque.append(transition)
                    loss = dqn.train_q_network(transition)

                # Checking the greedy distance to goal
                agent_greedy.reset()
                goals = []
                for j in range(n_step):
                    action_to_take = dqn.get_best_action(agent_greedy.state)
                    transition = agent_greedy.step(
                        action=action_to_take, greedy=True, r_fun=r_fun
                    )
                    goals.append(agent_greedy.distance_to_goal)
                y.append(min(goals))
        y_dic[r_fun.__name__] = y
        print("END\n\n")

    for k in list_rfun:
        fig = plt.figure(figsize=(15, 10))
        ax1 = plt.subplot(1, 1, 1)

        x = range(n_iteration)
        y = y_dic[k.__name__]
        print(x)
        print(y)

        ax1.plot(x, y, label=f"function : {k.__name__}")
        ax1.plot(x, y_greed, label=f"function : default function")
        ax1.set_xlabel("Steps")
        ax1.set_ylabel("Distance to goal")
        plt.title(
            (
                f"Loss function (Bellman with target network) over the number"
                f" of steps {n_step} and {n_iteration}"
                f" iterations with batch size = {batch_size}"
                f" learning rate = {lr}"
                f" discount factor = {gamma}"
            )
        )

        plt.legend()
        plt.savefig(f"../template/reward_{k.__name__}")
        plt.show()

    # Visualisation path taken
    init_state = environment.init_state
    goal_state = environment.goal_state

    agent.reset()
    stop_cpt = 0
    state = []

    while (
        not np.array_equal(
            np.array([round(init_state[0], 2), round(init_state[1], 2)]),
            goal_state,
        )
    ) and stop_cpt < 100:
        print(f"prev_state = {init_state}")
        action_to_take = dqn.predict(init_state)
        action = np.argmax(action_to_take)
        transition = agent.step(action=action, verbose=True)

        state.append(
            (
                (round(init_state[0], 2), round(init_state[1], 2)),
                action_to_take[action],
            )
        )
        init_state = transition[3]

        stop_cpt += 1

        print(f"action_to take = {action_to_take}")
        print(f"action = {action}")
        print(f"cpt = {stop_cpt}")
        print(f"next_state = {init_state}")
        print(type(init_state))

    if stop_cpt < 100:
        state.append(((round(goal_state[0], 2), round(goal_state[1], 2)), 0))

    vizp = VisualizationP(state, verbose=True)
    vizp.draw()
    vizp.save("../template/path_r_3.png")
