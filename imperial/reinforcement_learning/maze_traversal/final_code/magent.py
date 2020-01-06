import numpy as np

# from torch.utils.tensorboard import SummaryWriter
import torch
import time
import collections
import copy


class Agent:

    # Function to initialise the agent
    def __init__(self):

        # Set the episode length (you will need to increase this)

        # Reset the total number of steps which the agent has taken
        self.num_steps_taken = 0

        # The state variable stores the latest state of the agent in
        # the environment
        self.state = None

        # The action variable stores the latest action which the agent has
        # applied to the environment
        self.action = None

        # Get Actions
        self.actions = [0, 1, 2, 3]

        self.last_disitance = 1

        # Set network
        verbose = False
        gamma = 0.8
        lr = 0.001
        self.batch_size = 64
        self.dqn = DQN(
            batch_size=self.batch_size, lr=lr, gamma=gamma, verbose=verbose
        )
        self.epsilon = 1

        # Change so that update when loss stabilised
        self.update_target_freq = 20
        self.episode_length = 200

        # Reward
        self.r_hit_wall = 0.8
        self.r_avancement = 1.2
        # self.r_upanddown = 3
        self.r_left = 0.8
        # self.goal = 3

        # Epsilon
        self.e_decay = 25000
        self.stop_random = 5000

        # Pseudo random
        self.start_greed = 20000
        self.greed_step = 20
        self.greed = False

        # Greedy episode
        self.greedy_episode = False
        self.greed_n = 7
        self.greed_cpt = 0
        self.time = time.time()

        # Best network
        self.best_net = 0
        self.qnet_to_use = 0
        self.best_dist = 1
        self.saved_dist = 1
        self.best_nstp = 400
        self.arrived = False

        # Saving
        self.start_saving = False

        # If blocked to continue exploration
        self.blocked = False
        self.cpt = 0

        self.stop = False
        # Reseting replaybuffer
        ReplayBuffer.reset()

    def _update_epsilon(self):
        if self.epsilon > 0.1:
            self.epsilon = np.exp(
                -(self.num_steps_taken - self.stop_random) / self.e_decay
            )
        else:
            self.epsilon = 0.1

    def _reward(self, distance_to_goal, next_state):

        r = (1 - distance_to_goal) ** 2 if ((1 - distance_to_goal) > 0) else 0

        if distance_to_goal < 0.04:
            r += 10

        if self.action == 0:
            r *= self.r_avancement

        elif self.action == 3:
            r *= self.r_left

        # else:
        #     r *= self.r_upanddown

        if np.array_equal(next_state, self.state):
            self.blocked = True
            r *= self.r_hit_wall

        return r

    # Function to check whether the agent has reached the end of an episode
    def has_finished_episode(self):

        if self.num_steps_taken % self.update_target_freq == 0:
            if not self.stop and not (
                self.start_saving and (self.greed_cpt % self.greed_n == 0)
            ):
                self.dqn.update_target()

        if self.num_steps_taken >= self.start_greed:
            if not self.greed:
                # print("Start Greed")
                self.greed = True

        if time.time() >= self.time + 400 and (not self.greedy_episode):
            # print("Greedy episodes")
            self.greedy_episode = True

        # if (
        #     (self.greed_cpt % self.greed_n == 0)
        #     and self.num_steps_taken % self.episode_length == 198
        #     and self.greedy_episode
        #     and self.start_saving
        # ):
        #     # print(f"best dist each run: {self.last_disitance}")
        #     # print("END OF RUN")

        if self.num_steps_taken % self.episode_length == 0:
            self.greed_cpt += 1

            if time.time() >= self.time + 500 and (not self.start_saving):
                # print("Start saving")
                self.start_saving = True

            if (
                (self.greed_cpt % self.greed_n == 0)
                and self.greedy_episode
                and self.start_saving
            ):
                self.best_dist = self.last_disitance

            self.arrived = False
            self.last_disitance = 1
            return True

        else:
            return False

    # Function to get the next action, using whatever method you like
    def get_next_action(self, state):

        # 10 seconds before we stop the training and load the best
        # network
        if time.time() > self.time + 590 and not self.stop:
            # print("Time's up")
            if isinstance(self.qnet_to_use, int):
                self.qnet_to_use = copy.deepcopy(self.dqn)

            self.dqn = self.qnet_to_use
            # print("Net saved")
            self.stop = True

        # Get action
        state = torch.tensor(state)
        action = self.get_greedy_epsilon(state)

        if self.num_steps_taken <= self.start_greed:
            discrete_action = self._choose_action(action)
        else:
            if self.num_steps_taken % self.episode_length <= self.greed_step:
                discrete_action = action
            else:
                discrete_action = self._choose_action(action)

        if (
            self.blocked
            and (self.num_steps_taken > self.stop_random)
            and (action == 0 or action == 3)
        ):
            self.cpt += 1
            if self.cpt <= 10:
                action = 2  # go up
                discrete_action = action
            else:
                action = 1  # Go down
                discrete_action = action
            self.blocked = False
        else:
            self.cpt = 0

        if self.greedy_episode and (self.greed_cpt % self.greed_n == 0):
            continuous_action = self.get_greedy_action(state)
            discrete_action = action
            # print(f"action {discrete_action}")
            # print(f"continuous {continuous_action}")  # MAJOR CHANGEs
        else:
            # Convert the discrete action into a continuous action.
            continuous_action = self._discrete_action_to_continuous(
                discrete_action
            )

        # Update the number of steps which the agent has taken
        self.num_steps_taken += 1

        # Store the state; this will be used later, when storing the
        # transition
        self.state = state

        # Store the action; this will be used later, when storing the
        # transition
        self.action = discrete_action
        return continuous_action

    # Function to set the next state and distance, which resulted from
    # applying action self.action at state self.state
    def set_next_state_and_distance(self, next_state, distance_to_goal):
        self.last_disitance = distance_to_goal

        # Check whether or not the full greedy policy should be saved
        # First check if this the best distance
        # Then check if the agent has not already arrived
        # Check if this is a full greedy episode
        # Finally check if it should be saved

        if (
            (not self.arrived)
            and self.greedy_episode
            and self.start_saving
            and (self.greed_cpt % self.greed_n == 0)
        ):
            if self.last_disitance < 0.05 or (
                self.num_steps_taken % self.episode_length >= 199
            ):
                self.arrived = True
                # print(
                #     (
                #         f"best steps for that run ="
                #         f" {self.num_steps_taken % self.episode_length}"
                #     )
                # )
                # print(f"best overall step {self.best_nstp}")
                # print(f"best overall dist {self.saved_dist}")
                # print(f"last dist for that run = {self.last_disitance}")
                # print("\n\n\n")

            if (
                self.last_disitance < max(self.saved_dist, 0.05)
                and self.num_steps_taken % self.episode_length
                <= self.best_nstp
                and self.arrived
            ):
                self.best_nstp = copy.deepcopy(
                    self.num_steps_taken % self.episode_length
                )
                self.best_net = copy.deepcopy(self.dqn.q_network.state_dict())
                self.saved_dist = copy.deepcopy(self.last_disitance)
                # torch.save(
                #     self.best_net,
                #     f"./net_bd{int(self.saved_dist)}_ns_{self.best_nstp}",
                # )
                self.qnet_to_use = copy.deepcopy(self.dqn)
                # print("#########")
                # print(f"best dist = {self.saved_dist}")
                # print(f"Number of step = {self.best_nstp}")
                # print("-------")

        # Convert the distance to a reward
        next_state = torch.tensor(next_state)
        reward = self._reward(distance_to_goal, next_state)

        # Create a transition
        transition = (self.state, self.action, reward, next_state)

        if len(ReplayBuffer.deque) < self.batch_size:
            ReplayBuffer.deque.append(transition)

        else:
            ReplayBuffer.deque.append(transition)
            # Training the network only if we're not saving the network
            # for the best run

            if not self.stop:
                if not (
                    self.start_saving and (self.greed_cpt % self.greed_n == 0)
                ):
                    loss = self.dqn.train_q_network(transition)
                else:
                    loss = 0
            else:
                loss = 0

            # When it has finished start exploration
            # We start updating epsilon so that it decreases
            if self.num_steps_taken > self.stop_random:
                self._update_epsilon()

    # Get Greedy action for training
    def get_greedy_epsilon(self, state):
        action = self.dqn.get_best_action(state)
        return action

    # Get Greedy action for testing
    def get_greedy_action(self, state):
        # Here, the greedy action is fixed, but you should change it so
        # that it returns the action with the highest Q-value
        if (
            isinstance(state, torch.FloatTensor)
            or isinstance(state, torch.IntTensor)
            or isinstance(state, torch.LongTensor)
        ):
            state_tensor = state
        else:
            state_tensor = torch.tensor(state)
        action = self.dqn.get_best_action(state_tensor)
        return self._discrete_action_to_continuous(action)

    # Choosing action with epsilon greedy policy
    def _choose_action(self, action):
        probability = (self.epsilon / len(self.actions)) * np.ones(
            len(self.actions)
        )
        probability[action] += 1 - self.epsilon
        return np.random.choice(self.actions, p=probability)

    # Transforming a discrete action into continuous
    def _discrete_action_to_continuous(self, discrete_action):

        # Transforamtion :
        #   - 0.00 < discrete_action < 0.75 : action ==> 0 Right
        #   - 0.75 < discrete_action < 1.50 : action ==> 1 Down
        #   - 1.50 < discrete_action < 2.25 : action ==> 2 Up
        #   - 2.25 < discrete_action < 3.00 : action ==> 3 Left

        if discrete_action < 0.75:
            return np.array([0.02, 0], dtype=np.float32)

        elif discrete_action < 1.5:
            return np.array([0, -0.02], dtype=np.float32)

        elif discrete_action < 2.25:
            return np.array([0, 0.02], dtype=np.float32)

        else:
            return np.array([-0.02, 0], dtype=np.float32)


# Import some modules from other libraries

# The Network class inherits the torch.nn.Module class, which represents a
# neural network.
class Network(torch.nn.Module):

    # The class initialisation function. This takes as arguments the dimension
    # of the network's input (i.e. the dimension of the state), and the
    # dimension of the network's output (i.e. the dimension of the action).

    def __init__(self, input_dimension, output_dimension):
        # Call the initialisation function of the parent class.
        super(Network, self).__init__()

        # Define the network layers. This example network has two hidden
        # layers, each with 100 units.
        self.layer_1 = torch.nn.Linear(
            in_features=input_dimension, out_features=100
        )
        self.layer_2 = torch.nn.Linear(in_features=100, out_features=100)
        self.layer_3 = torch.nn.Linear(in_features=100, out_features=100)
        self.output_layer = torch.nn.Linear(
            in_features=100, out_features=output_dimension
        )

    # Function which sends some input data through the network and returns the
    # network's output. In this example, a ReLU activation function is used for
    # both hidden layers, but the output layer has no activation function (it
    # is just a linear layer).
    def forward(self, inputt):
        if inputt.shape == torch.Size([2]):
            inputt = inputt.view(1, -1)
        torch.nn.functional.leaky_relu
        layer_1_output = torch.nn.functional.leaky_relu(self.layer_1(inputt))
        layer_2_output = torch.nn.functional.leaky_relu(
            self.layer_2(layer_1_output)
        )
        layer_3_output = torch.nn.functional.leaky_relu(
            self.layer_3(layer_2_output)
        )
        output = self.output_layer(layer_3_output)
        # torch.nn.functional.relu(self.output_layer(layer_2_output))
        # torch.nn.Softmax(dim=1)(self.output_layer(layer_2_output))
        return output


# The DQN class determines how to train the above neural network.
class DQN:

    # The class initialisation function.
    def __init__(
        self, batch_size=64, lr=0.001, gamma=0.9, target=False, verbose=False
    ):
        # Create a Q-network, which predicts the q-value for a particular
        # state.
        self.actions = [0, 1, 2, 3]
        self.q_network = Network(input_dimension=2, output_dimension=4)

        # Define the optimiser which is used when updating the Q-network. The
        # learning rate determines how big each gradient step is during
        # backpropagation.
        self.optimiser = torch.optim.Adam(self.q_network.parameters(), lr=lr)
        self.verbose = verbose
        self.gamma = gamma
        self.batch_size = batch_size
        if not target:
            self.dqn_target = DQN(target=True)

    # Function that is called whenever we want to train the Q-network. Each
    # call to this function takes in a transition tuple containing the data
    # we use to update the Q-network.
    def train_q_network(self, transition):
        # Set all the gradients stored in the optimiser to zero.
        self.optimiser.zero_grad()

        # Calculate the loss for this transition.
        loss = self._calculate_loss_batch()

        # Compute the gradients based on this loss, i.e. the gradients of the
        # loss with respect to the Q-network parameters.
        loss.backward()

        # Take one gradient step to update the Q-network.
        self.optimiser.step()
        # Return the loss as a scalar
        return loss.item()

    def _calculate_loss_batch(self):
        batch_sample = ReplayBuffer.get_batch(batch_size=self.batch_size)

        # Bellman Equation
        batch_reward = torch.tensor(
            [[batch_sample[k][2]] for k in range(len(batch_sample))]
        )
        batch_nstate = torch.stack(
            [batch_sample[k][3] for k in range(len(batch_sample))]
        )

        batch_labels_tensor = self._bellman(batch_reward, batch_nstate)

        # Get the inputs
        batch_input_tensor = torch.stack(
            [batch_sample[k][0] for k in range(len(batch_sample))], dim=0
        )

        get_result = torch.tensor(
            [[batch_sample[k][1]] for k in range(len(batch_sample))]
        )

        network_prediction = self.q_network.forward(batch_input_tensor)

        loss = torch.nn.MSELoss()(
            batch_labels_tensor,
            torch.gather(network_prediction, 1, get_result),
        )
        return loss

    def _bellman(self, r, state):
        predictions_target = self.dqn_target.predict(state)
        predictions_online = self.predict(state)
        maxQ = torch.gather(
            predictions_online,
            1,
            predictions_target.argmax(dim=1).reshape(-1, 1),
        )
        return r + (self.gamma * maxQ)

    def get_best_action(self, state):
        prediction = self.predict(state)
        return prediction.argmax()

    def update_target(self):
        cur_net = self.q_network.state_dict()
        self.dqn_target.q_network.load_state_dict(cur_net)

    def predict(self, inputt):
        network_prediction = self.q_network.forward(inputt)
        return network_prediction.detach()

    def print(self, msg):
        if self.verbose:
            print(msg)


class ReplayBuffer(object):
    deque = collections.deque(maxlen=50000)

    @classmethod
    def get_batch(cls, batch_size=50):
        list_indices = list(
            np.random.randint(0, len(ReplayBuffer.deque), batch_size)
        )
        return [cls.deque[k] for k in list_indices]

    @classmethod
    def reset(cls):
        cls.deque = collections.deque(maxlen=50000)
