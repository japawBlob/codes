# This is a sample Python script.
import matplotlib.pyplot as plt
import numpy as np
import matplotlib.ticker as ticker
#import numpy
# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
#import numpy
memSize = []


def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.


def ranGraph():
    # corresponding y axis values
    y = [5, 5, 5, 5, 5, 5, 10, 13, 16, 17, 38, 49, 54, 58, 62, 67, 72, 78, 86]

    # plotting the points

    fig, ax = plt.subplots()
    plt.xlim([1024, 64*4*1024*1024*2])
    ax.set_xscale('log', base=2)
    plt.plot(memSize, y, 'r')
    plt.plot(memSize, y, 'ro')
    # naming the x axis
    plt.xlabel('memory size')
    # naming the y axis
    plt.ylabel('number of ticks')

    # giving a title to my graph
    plt.title('My first graph!')

    # function to show the plot
    plt.grid(axis='y')
    plt.show()


def seqGraph():
    y = [5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
# plotting the points
    fig, ax = plt.subplots()
    plt.ylim([0, 90])
    plt.xlim([1024, 64*4*1024*1024*2])
    ax.set_xscale('log', base=2)
    plt.plot(memSize, y)
    plt.plot(memSize, y, 'bo')
    # naming the x axis
    plt.xlabel('memory size')
    # naming the y axis
    plt.ylabel('number of ticks')

    # giving a title to my graph
    plt.title('sequential graph')

    # function to show the plot
    plt.grid(axis='y')
    plt.show()

def bothGprahs():
    y1 = [5, 5, 5, 5, 5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
    y2 = [5, 5, 5, 5, 5, 5, 10, 13, 16, 17, 38, 49, 54, 58, 62, 67, 72, 78, 86]
    # plotting the points
    fig, ax = plt.subplots()
    plt.ylim([0, 90])
    plt.xlim([1024, 64 * 4 * 1024 * 1024 * 2])
    ax.set_xscale('log', base=2)
    plt.plot(memSize, y2, 'ro')
    plt.plot(memSize, y1, label='sequential')
    plt.plot(memSize, y2, 'r', label='random')
    plt.plot(memSize, y1, 'bo')


    # naming the x axis
    plt.xlabel('memory size')
    # naming the y axis
    plt.ylabel('number of ticks')

    # giving a title to my graph
    plt.title('combined graph')

    # function to show the plot
    plt.grid(axis='y')

    plt.axhspan(i, i + .2, facecolor='0.2', alpha=0.5)
    plt.axvspan(0, 2**15, facecolor='g', alpha=0.2)
    plt.axvspan(2 ** 15, 2 ** 19, facecolor='orange', alpha=0.2)
    plt.axvspan(2 ** 19, 2 ** 29, facecolor='violet', alpha=0.2)
    #plt.text(40, 5793, "s")
    ax.text(2**12.5, 44, 'L1', fontsize=15, horizontalalignment='center',
        verticalalignment='center')
    ax.text(2**17, 44, 'L2', fontsize=15,horizontalalignment='center',
        verticalalignment='center')
    ax.text(2 ** 24, 44, 'RAM', fontsize=15, horizontalalignment='center',
            verticalalignment='center')
    leg = ax.legend();
    plt.savefig('graph.png')
    plt.show()


# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    print_hi('PyCharm')
    i = 1024
    while i <= 268435456:
        memSize.append(i)
        i *= 2

    ranGraph()
    seqGraph()
    bothGprahs()