#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..
# base = /mt-exercise-03
data=$base/data
# data = /mt-exercise-03/data

tools=$base/tools

# link default training data for easier access

mkdir -p $data/wikitext-2

for corpus in train valid test; do
    absolute_path=$(realpath $tools/pytorch-examples/word_language_model/data/wikitext-2/$corpus.txt)
    ln -snf $absolute_path $data/wikitext-2/$corpus.txt
done

cd data
# python -c """
# import nltk
# nltk.download('punkt')
# """
python3 preproccessing.py

mkdir -p seinfeld
mv test.txt seinfeld/test.txt
mv valid.txt seinfeld/valid.txt
mv train.txt seinfeld/train.txt

cd ..
# cat $data/data.txt | python $base/scripts/preprocess_raw.py > $data/grimm/raw/tales.cleaned.txt

# cat $data/grimm/raw/tales.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
#     $data/grimm/raw/tales.preprocessed.txt

# head -n 440 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/valid.txt
# head -n 840 $data/grimm/raw/tales.preprocessed.txt | tail -n 400 > $data/grimm/test.txt
# tail -n 3075 $data/grimm/raw/tales.preprocessed.txt | head -n 2955 > $data/grimm/train.txt
