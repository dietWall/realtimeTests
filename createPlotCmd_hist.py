#! /usr/bin/python3

import sys, argparse


inputfile = 'hist.txt'
outputfile = 'plotcmd'

xlabel = 'Durations(us)'
ylabel = 'Number of duration samples'
ylog = True
yrange = '[0.0:*]'
xrange = '[*:*]'
title = "Duration Plot"

parser = argparse.ArgumentParser(description='Creates a plotcmd for a histogram data file')

parser.add_argument('--title', type=str, default=title, help='sets the histogram title')

parser.add_argument('--xlabel', type=str, default=xlabel, help='sets the label for the xaxis')
parser.add_argument('--xrange', type=str, default=xrange, help='sets the range for the xaxis: [min:max]')

parser.add_argument('--ylabel', type=str, default=ylabel, help='sets the label for the yaxis')
parser.add_argument('--yrange', type=str, default=yrange, help='sets the range for the yaxis: [min:max]')

parser.add_argument('--inputfile', type=str, default='hist.txt', help='changes the input file')
parser.add_argument('--column', type=int, default=2, help='defines the data column in the file')

args=parser.parse_args()

plotcmd = ('set title \"' + title + "\""+ '\n'
        'set terminal png \n'
        'set xlabel \"' + args.xlabel + '\"\n'
        'set xrange ' + args.xrange + '\n'
        'set ylabel \"' + args.ylabel + '\"\n'
        'set yrange ' + args.yrange + '\n'
        'set logscale y\n'
        'set xtics font \" ,6\"\n'
        'set output \"' + args.title + '.png\"\n'
        'plot \"' + args.inputfile + '\" using 1:' + str(args.column) + ' title \"' + args.title + '\" with histeps\n' 
)

print('full command: \n' + plotcmd)

cmd = open(title + '_plotcmd', 'w')
cmd.write(plotcmd)
cmd.close()

