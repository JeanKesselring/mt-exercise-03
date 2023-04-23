<!-- Jean Kesselring & Micha Hess -->

# MT Exercise 3: Pytorch RNN Language Models

This repo shows how to train neural language models using [Pytorch example code](https://github.com/pytorch/examples/tree/master/word_language_model). Thanks to Emma van den Bold, the original author of these scripts. 

### Requirements

- This only works on a Unix-like system, with bash.
- Python 3 must be installed on your system, i.e. the command `python3` must be available
- Make sure virtualenv is installed on your system. To install, e.g.

    `pip install virtualenv`

## Task 1
### Steps

Clone this repository in the desired place:

    git clone https://github.com/JeanKesselring/mt-exercise-03
    cd mt-exercise-03

Create a new virtualenv that uses Python 3. Please make sure to run this command outside of any virtual Python environment:

    ./scripts/make_virtualenv.sh

**Important**: Then activate the env by executing 

    source ./venvs/torch3/bin/activate

Make sure you're in the **torch3 virtual environment**, then run the following script to download and install required software:

    ./scripts/install_packages.sh

The data we are working with - scripts from the 90s sitcom Seinfeld - are already included in the repo  sitory. In order to process it, simply run the following command:

    ./scripts/process_data.sh

This will call the custom pre-processing script fitted to our data, and automatically run it on the Seinfeld-data. the output can be found in the directory `data/seinfeld`.

Train a model:

    ./scripts/train.sh

(if on a device **without** CUDA, disable that in the train.sh file. the `sudo` command in line 18 is necessary for users running on WSL2, since it reaches across filesystems)

The training process can be interrupted at any time, and the best checkpoint will always be saved.

Generate (sample) some text from a trained model with:

    ./scripts/generate.sh


## Task 2
### Training
To train multiple models with different dropout parameters, we modified the shell- and python scripts that take care of this. <br>Now, multiple values can be passed into the `--dropout` flag. The script for task 2 (`train2.sh`) also calls a modified version of the `main.py` script, which is stored in the `task_2`-folder, along with the other necessary modified dependencies.

    ./scripts/train.sh

Along with training multiple models, this script will also create log-files in the directory `logsandplots`.
### Visualization
To create plots out of these log files, the following script should be run:

    ./scripts/visualize.sh

The plots will be stored in the same directory as the log-files.

### Generating
To generate seqences for multiple models, we slightly adapted the scripts for this part of the task as well. We replaced `--checkpoint` with `--checkpoints`, which can take multiple arguments (`.pt`-model files). It will store all generated text within the same file, but each chunk will be prefaced by the name of the model used (the name should contain some relevant information, such as differing dropout-values in our case). If every previous script was run as-is, running the following script should create a text-sample:

    ./scripts/generate2.sh



