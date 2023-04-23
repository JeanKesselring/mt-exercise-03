#! /bin/bash

scripts=$(dirname "$0")
echo $scripts
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0

(cd $scripts/task_2 &&
   CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads sudo python3 main.py --data $data/seinfeld \
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0 0.05 0.1 0.2 0.4 0.6 --tied \
        --save $models/model.pt \
        --cuda \
        --ppl-log \
        --dry-run
)

mkdir -p $scripts/task_2/raeuber_logsandplots
# cd ..
pwd
mv $scripts/task_2/test.csv $scripts/task_2/logsandplots/test.csv
mv $scripts/task_2/validation.csv $scripts/task_2/logsandplots/validation.csv
mv $scripts/task_2/training.csv $scripts/task_2/logsandplots/training.csv
echo "time taken:"
echo "$SECONDS seconds"