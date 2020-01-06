import torch
from lib.Network import Network
from lib.ReplayBuffer import ReplayBuffer
import numpy as np


# The DQN class determines how to train the above neural network.
class DQN:

    # The class initialisation function.
    def __init__(self, lr=0.001, gamma=0.9, target=False, verbose=False):
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
        batch_sample = ReplayBuffer.get_batch()
        batch_inputs = [batch_sample[k][0] for k in range(len(batch_sample))]

        # Bellman Equation
        batch_labels = [
            [self._bellman(batch_sample[k][2], batch_sample[k][3])]
            for k in range(len(batch_sample))
        ]
        batch_labels_tensor = torch.tensor(batch_labels)

        # Get the inputs
        batch_input_tensor = torch.tensor(batch_inputs)
        get_result = torch.tensor(
            [[batch_sample[k][1]] for k in range(len(batch_sample))]
        )
        network_prediction = self.q_network.forward(batch_input_tensor)

        loss = torch.nn.MSELoss()(
            batch_labels_tensor,
            torch.gather(network_prediction, 1, get_result),
        )

        # self.print("\n\n####")
        # self.print(f"batch_input_tensor  = {batch_input_tensor}")
        # self.print(f"batch_labels_tensor  = {batch_labels_tensor}")
        # self.print(
        #     (
        #         f"network_prediction_gathered = "
        #         + str(torch.gather(network_prediction, 1, get_result))
        #     )
        # )
        # self.print(f"loss = {loss.item()}")
        # self.print("-----------")
        return loss

    def _bellman(self, r, state):
        predictions = self.dqn_target.predict(state)
        maxQ = predictions[predictions.argmax()]
        return r + (self.gamma * maxQ)

    def get_best_action(self, state):
        prediction = self.predict(state)
        return prediction.argmax()

    def update_target(self):
        cur_net = self.q_network.state_dict()
        self.dqn_target.q_network.load_state_dict(cur_net)

        # print("\n\n\n\n\n\n UPDATE \n\n\n\n\n\n\n\n\n\n\n\n")

    def predict(self, inputt):
        input_tensor = torch.tensor(inputt)
        network_prediction = self.q_network.forward(input_tensor)
        return network_prediction.detach().numpy()

    def print(self, msg):
        if self.verbose:
            print(msg)
