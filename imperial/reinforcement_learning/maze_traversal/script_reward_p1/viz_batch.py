from paths import check_path
from lib.Agent import Agent
from lib.DQN_reward import DQN
from lib.environment import Environment

import torch
import numpy as np
from lib.ReplayBuffer import ReplayBuffer
from lib.VisualizationQ import VisualizationQ
from lib.VisualisationP import VisualizationP

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
    dqn = DQN(lr=lr)

    # Loop over episodes

    # Reset the environment for the start of the episode.
    agent.reset()

    n_iteration = 500
    n_step = 20
    batch_size = 50
    y = []
    x = list(range(n_step))

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

    print("\n\n\n LEARNING OVER \n\n\n")

    # Vizualisation Q values
    viz = VisualizationQ(dqn, x=800)
    viz.draw()
    viz.save("./template/q_func_cv.png")

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
    vizp.save("./template/path.png")
