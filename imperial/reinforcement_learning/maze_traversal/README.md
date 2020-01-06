# Neural Network
Using PyTorch, I developed a deepQ learning Neural Network with some optimization to make an agent learn the best path to take to go from point A to point B.
The constraints were:
- 10 minutes of training
- Using only scalable methods
- No use of Gradient Policies

My agent was able to solve easy to medium-difficult mazes.
Project done in Imperial

## Folders
**final_code** : submited code for part2

**lib** : libraries used for part1

**part2** : More organized version of final_code. Contains :
- **lib2** : libraries used for part2
- **random_environment.py** : Generation of an environment in which the agent will evolve
- **test.py** : script launched to test the model after 10 mins of training
- **train_and_test.py** : train and test the agent on a random environment. This file should be launched, to check the application 

**reports** : Contains pdf of part 1's and part 2's report

**script_bellman_p1** : Part 1 scripts using Bellman's Equation. Contains:
- **diff_reward.py** : Evaluation of a DeepQ network, with batch input, target network and epsilon-greedy policy, according to different rewards
- **plot_batch_t_epsilon.py** : Evalutation of a DeepQ network, with batch input, target network and epsilon-greedy policy
- **plot_batch_target.py** : Evalutation of a DeepQ network, with batch input, target network
- **plot_batch_without_t.py** : Evalutation of a DeepQ network, with batch input and without target network
- **viz_batch_target.py** : Representation of Qvalues with openCV

**script_reward_p1** : Part 1 scripts only using rewards (without Bellman's Equation). Contains:
- **plot_batch.py** : Evaluation of a DeepQ network, with batch input
- **plot_online.py** : Evaluation of a DeepQ network, with single input
- **viz_batch.py** : Representation of Qvalues with openCV

**spec** : Folder that contains the specification for each part

