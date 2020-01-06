# Import some modules from other libraries
import numpy as np


# The Agent class allows the agent to interact with the environment.
class Agent:

    # The class initialisation function.
    def __init__(self, environment):

        # Set the agent's environment.
        self.environment = environment

        # Create the agent's current state
        self.state = None

        # Create the agent's total reward for the current episode.
        self.total_reward = None

        # Epsilon policy
        self.epsilon = 1

        # Actions
        self.action = [0, 1, 2, 3]

        # goal
        self.distance_to_goal = 0

        # Reset the agent.
        self.reset()

    # Function to reset the environment, and set the agent to its initial
    # state. This should be done at the start of every episode.

    def reset(self):

        # Reset the environment for the start of the new episode, and set the
        # agent's state to the initial state as defined by the environment.
        self.state = self.environment.reset()

        # Set the agent's total reward for this episode to zero.
        self.total_reward = 0.0

    # Function to make the agent take one step in the environment.

    def choose_action(self, action):
        probability = (
            self.epsilon / len(self.action) * np.ones(len(self.action))
        )
        probability[action] += 1 - self.epsilon
        return np.random.choice(self.action, p=probability)

    def step(
        self, action=None, verbose=False, greedy=False, delta=0, r_fun=None
    ):

        # Greedy policy
        if greedy:
            discrete_action = action

        else:
            discrete_action = self.choose_action(action)

        self.print(discrete_action, verbose)

        # Convert the discrete action into a continuous action.
        continuous_action = self._discrete_action_to_continuous(
            discrete_action
        )

        # Take one step in the environment, using this continuous action,
        # based on the agent's current state. This returns the next state,*
        # and the new distance to the goal from this new state. It also draws
        # the environment, if display=True was set when creating the
        # environment object..
        next_state, distance_to_goal = self.environment.step(
            self.state, continuous_action
        )

        # Compute the reward for this function.
        if r_fun:
            reward = r_fun(distance_to_goal)
        else:
            reward = self._compute_reward(distance_to_goal)

        # Create a transition tuple for this step.
        transition = (self.state, discrete_action, reward, next_state)

        # Set the agent's state for the next step, as the next state from
        # this step
        self.state = next_state

        # Update the agent's reward for this episode
        self.total_reward += reward

        # Update epsilon

        if self.epsilon - delta >= 0.1:
            self.epsilon -= delta
        else:
            self.epsilon = 0.1

        self.distance_to_goal = distance_to_goal

        # Return the transition
        return transition

    # Function for the agent to compute its reward. In this example, the
    # reward is based on the agent's distance to the goal after the agent
    # takes an action.

    def _compute_reward(self, distance_to_goal):
        reward = 1 - distance_to_goal
        return reward

    # Function to convert discrete action (as used by a DQN) to a continuous
    # action (as used by the environment).
    def _discrete_action_to_continuous(self, discrete_action):

        # Transforamtion :
        #   - 0.00 < discrete_action < 0.75 : action ==> 0 Right
        #   - 0.75 < discrete_action < 1.50 : action ==> 1 Down
        #   - 1.50 < discrete_action < 2.25 : action ==> 2 Left
        #   - 2.25 < discrete_action < 3.00 : action ==> 3 Up

        if discrete_action < 0.75:
            return np.array([0.1, 0], dtype=np.float32)

        elif discrete_action < 1.5:
            return np.array([0, -0.1], dtype=np.float32)

        elif discrete_action < 2.25:
            return np.array([-0.1, 0], dtype=np.float32)

        else:
            return np.array([0, 0.1], dtype=np.float32)

    def print(self, msg, verbose):
        if verbose:
            print(msg)
