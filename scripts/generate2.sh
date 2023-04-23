#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
samples=$base/samples

mkdir -p $samples

num_threads=4
device=""

(cd $scripts/task_2 &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python generate.py \
        --data $data/seinfeld \
        --words 100 \
        --checkpoints $models/model_drpt0.0.pt $models/model_drpt0.05.pt $models/model_drpt0.1.pt $models/model_drpt0.2.pt $models/model_drpt0.4.pt $models/model_drpt0.6.pt \
        --outf $samples/sample.txt \
)
