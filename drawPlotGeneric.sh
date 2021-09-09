#!/bin/bash
inputfile=hist.txt
title=hist

while getopts f:t: flag
do
	case "${flag}" in
		f) inputfile=${OPTARG};;
		t) title=${OPTARG};;
	esac
done


#Create plot command header
echo -n -e "set title \"Duration plot\"\n\
set terminal png\n\
set xlabel \"Duration (us)\"\n\
set logscale y\n\
set xrange [0:100]\n\
set xtics font \" ,6\"\n\
set yrange [1.0:*]\n\
set ylabel \"Number of duration samples\"\n\
set output \"plot.png\"\n\
plot " >plotcmd
echo -n "\"${inputfile}\" using 1:2 title \"$title\" with histeps" >>plotcmd

#Execute plot command
gnuplot -persist <plotcmd
