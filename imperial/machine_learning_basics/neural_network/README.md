# Neural Network
In this group project, I developed a Neural Network Framework. It includes:
- Linear layer
- Activation functions layer (sigmoid ...)
- Evaluation layers (Binary Cross entropy ...)

Then we used TensorFlow to solve a classification task in insurance pricing.

Finally using TensorFlow again, we created another insurance pricing model using real-world data. Our model was competing against models of other classmates. The purpose was to give the best pricing for each individual according to their risk. Each individual then chooses automatically the lower price among those proposed. Models were then ranked according to the profit they made.

Project done in Imperial
## Folders
**data** :  Contains the data used during this porject

**lib** : Contains the libraries created for this project

## Files
***.h5 and *.hdf5 and *.pickle** : final models according to each part of the project

**nn_lib.py** : Neural Network framework

**part2_claim_classifier.py** : Classifier using tensorflow for inusrance pricing

**part3_pricing_model_linear.py** : Linear model used for insurance pricing competition

**part3_pricing_model.py** : Neural network model used for insurance pricing competition

**pricing_library.py** : Test given by the teacher

**sample_hp_search_result.txt** : Results of the hyperparameter search done in part2
