from nltk.tokenize import word_tokenize, sent_tokenize
from nltk import FreqDist
from nltk.lm import Vocabulary
from random import shuffle

def process(file):
    with open(file, "r")as data:
        VOCAB_SIZE = 5000

        data = data.read().lower()
        tokenized = word_tokenize(data)
        fdist = FreqDist(tokenized)
        words = fdist.most_common(VOCAB_SIZE)
        words = [w[0] for w in words]
        vocab = Vocabulary(words, unk_cutoff=1)

        rows = data.split("\n\n")  # The data is structured, such that the dialog is separated by newline symbols
        output = []
        for row in rows:
            row_tokens = word_tokenize(row)
            filtered = vocab.lookup(row_tokens)
            output.append(" ".join(filtered))

        text = vocab.lookup(tokenized)
        with open("processed_data.txt","w", encoding="UTF-8")as file:
            file.write("\n".join(output))

def split_data(filename):
    with open(filename, "r")as input:
        input = input.read().split("\n")
        shuffle(input)
        train = input[:int(len(input)/10*9)]
        valid = input[int(len(input)/10*9):int(len(input)/10*9.5)]
        test = input[int(len(input)/10*9.5):]
        with open("train.txt","w", encoding="UTF-8")as file:
            file.write("\n".join(train))
        with open("valid.txt","w", encoding="UTF-8")as file:
            file.write("\n".join(valid))
        with open("test.txt","w", encoding="UTF-8")as file:
            file.write("\n".join(test))

if __name__ == "__main__":
    filename = "data.txt"
    process(filename)
    split_data("processed_data.txt")
    # print('great success!')