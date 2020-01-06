import torch
from lib.Network import Network
from lib.ReplayBuffer import ReplayBuffer


# The DQN class determines how to train the above neural network.
class DQN:

    # The class initialisation function.
    def __init__(self, lr=0.001, verbose=False):
        # Create a Q-network, which predicts the q-value for a particular
        # state.
        self.actions = [0, 1, 2, 3]
        self.q_network = Network(input_dimension=2, output_dimension=4)

        # Define the optimiser which is used when updating the Q-network. The
        # learning rate determines how big each gradient step is during
        # backpropagation.
        self.optimiser = torch.optim.Adam(self.q_network.parameters(), lr=lr)
        self.verbose = verbose

    # Function that is called whenever we want to train the Q-network. Each
    # call to this function takes in a transition tuple containing the data
    # we use to update the Q-network.
    def train_q_network(self, transition, online=False):
        # Set all the gradients stored in the optimiser to zero.
        self.optimiser.zero_grad()

        # Calculate the loss for this transition.
        loss = (
            self._calculate_loss_online(transition)
            if online
            else self._calculate_loss_batch()
        )

        # Compute the gradients based on this loss, i.e. the gradients of the
        # loss with respect to the Q-network parameters.
        loss.backward()

        # Take one gradient step to update the Q-network.
        self.optimiser.step()
        # Return the loss as a scalar
        return loss.item()

    # Function to calculate the loss for a particular transition.
    def _calculate_loss_online(self, transition):
        input_t = transition[0]
        labels = transition[2]

        input_tensor = torch.tensor(input_t)
        labels_tensor = torch.tensor([labels])

        network_prediction = self.q_network.forward(input_tensor)

        self.print(f"labels_tensor  = {labels_tensor}")
        self.print(
            (
                f"network_prediction_gathered = "
                + str(
                    torch.gather(
                        network_prediction, 0, torch.tensor([transition[1]])
                    )
                )
            )
        )
        self.print(f"input = {input_t}")
        loss = torch.nn.MSELoss()(
            torch.gather(network_prediction, 0, torch.tensor([transition[1]])),
            labels_tensor,
        )  # Torch gather
        self.print(f"loss = {loss}")

        return loss

    def _calculate_loss_batch(self):
        batch_sample = ReplayBuffer.get_batch()
        batch_inputs = [batch_sample[k][0] for k in range(len(batch_sample))]
        batch_labels = [[batch_sample[k][2]] for k in range(len(batch_sample))]

        batch_input_tensor = torch.tensor(batch_inputs)
        batch_labels_tensor = torch.tensor(batch_labels)
        get_result = torch.tensor(
            [[batch_sample[k][1]] for k in range(len(batch_sample))]
        )

        network_prediction = self.q_network.forward(batch_input_tensor)
        self.print("\n\n####")
        self.print(f"batch_input_tensor  = {batch_input_tensor}")
        self.print(f"batch_labels_tensor  = {batch_labels_tensor}")
        self.print(f"network_prediction = {network_prediction}")
        self.print(f"get_result = {get_result}")
        self.print(
            (
                f"network_prediction_gathered = "
                + str(torch.gather(network_prediction, 1, get_result))
            )
        )

        loss = torch.nn.MSELoss()(
            torch.gather(network_prediction, 1, get_result),
            batch_labels_tensor,
        )
        self.print(f"loss = {loss.item}")
        self.print("-----------")
        return loss

    def predict(self, input):
        input_tensor = torch.tensor(input)
        network_prediction = self.q_network.forward(input_tensor)
        return network_prediction.detach().numpy()

    def print(self, msg):
        if self.verbose:
            print(msg)
