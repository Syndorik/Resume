import torch
from lib2.Network import Network
from lib2.ReplayBuffer import ReplayBuffer
import numpy as np


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

        # print("\n\n\n\n\n\n UPDATE \n\n\n\n\n\n\n\n\n\n\n\n")

    def predict(self, inputt):
        network_prediction = self.q_network.forward(inputt)
        return network_prediction.detach()

    def print(self, msg):
        if self.verbose:
            print(msg)
