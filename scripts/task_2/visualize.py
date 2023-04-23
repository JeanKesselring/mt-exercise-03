import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import argparse
import numpy as np
sns.set_theme(style="darkgrid")

sns.set_context('poster')
parser = argparse.ArgumentParser(description='Visualize training progress of different models')
parser.add_argument('--files', type=str, default='./data/wikitext-2', nargs='+',
                    help='files to be used as source')
args = parser.parse_args()

def harry_plotter(filename):
    name = filename[23:-4]
    outname = filename[2:-4]
    df = pd.read_csv(filename, index_col=0)
    colorpalette = 'Paired_r'
    # print(df)
    if name == 'test':
        plot = sns.barplot(data=df, palette=colorpalette, dodge=True)
    else: 
        plot = sns.lineplot(data=df, palette=colorpalette, dashes=False)
        plot.set_xlabel('epochs')
    plot.set_title(name)
    # interval = 
    # plot.set_yticklabels(np.arange(0, 
    #                            np.int_(df.max(axis=None))+1,
    #                            max(1,np.int_((df.max(axis=None)-df.min(axis=None))/10))))
    plot.set(yscale='log')
    plot.set_ylabel('perplexity')
    fig = plot.get_figure()
    fig.set_size_inches(18.5, 10.5)
    fig.savefig(f'{outname}_plot.png')
    plt.clf()

if __name__ == '__main__':
    for filename in args.files:
        harry_plotter(filename)