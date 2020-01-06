import time
import numpy as np

from random_environment import Environment
from lib2.agent import Agent
import torch


# Main entry point
if __name__ == "__main__":

    # This determines whether the environment will be displayed on each each
    # step.
    # When we train your code for the 10 minute period, we will not display
    # the environment.
    display_on = False

    # Create a random seed, which will define the environment
    random_seed = int(time.time())
    random_seed = 1574271477
    np.random.seed(random_seed)

    # Create a random environment
    environment = Environment(magnification=100)

    # Create an agent
    agent = Agent()

    # Get the initial state
    state = environment.init_state
    print(f"seed : {random_seed}")
    agent.dqn.q_network.load_state_dict(torch.load("./net_bd0_ns_64"))

    for k in range(5):
        # Test the agent for 100 steps, using its greedy policy
        state = environment.init_state
        has_reached_goal = False
        print("START EVALUATION")
        for step_num in range(200):
            action = agent.get_greedy_action(state)
            next_state, distance_to_goal = environment.step(state, action)
            # The agent must achieve a maximum distance of 0.03 for use to
            # consider it "reaching the goal"
            if distance_to_goal < 0.03:
                has_reached_goal = True
                break
            state = next_state
            environment.show(state)

    # Print out the result
    if has_reached_goal:
        print("Reached goal in " + str(step_num) + " steps.")
    else:
        print("Did not reach goal. Final distance = " + str(distance_to_goal))
