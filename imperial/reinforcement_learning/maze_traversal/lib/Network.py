# Import some modules from other libraries
import torch


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
        self.output_layer = torch.nn.Linear(
            in_features=100, out_features=output_dimension
        )

    # Function which sends some input data through the network and returns the
    # network's output. In this example, a ReLU activation function is used for
    # both hidden layers, but the output layer has no activation function (it
    # is just a linear layer).
    def forward(self, inputt):
        layer_1_output = torch.nn.functional.relu(self.layer_1(inputt))
        layer_2_output = torch.nn.functional.relu(self.layer_2(layer_1_output))
        output = self.output_layer(layer_2_output)
        return output
