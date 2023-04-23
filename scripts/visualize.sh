#! /bin/bash

scripts=$(dirname "$0")

# base=$(realpath $scripts/..)

# models=$base/models
# data=$base/data
# tools=$base/tools

cd $scripts/task_2
# pwd
python visualize.py --files ./raeuber_logsandplots/test.csv ./raeuber_logsandplots/training.csv ./raeuber_logsandplots/validation.csv