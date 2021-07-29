#!/bin/bash
cyclictestoutputfile=hist.txt
title=hist

while getopts f:t: flag
do
	case "${flag}" in
		f) cyclictestoutputfile=${OPTARG};;
		t) title=${OPTARG};;
	esac
done

#Get maximum latency
#max=`grep "Max Latencies" ${cyclictestoutputfile} | tr " " "\n" | sort -n | tail -1 | sed s/^0*//`

#Grep data lines, remove empty lines and create a common field separator
#grep -v -e "^#" -e "^$" ${cyclictestoutputfile} | tr " " "\t" >histogram 


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
echo -n "\"${cyclictestoutputfile}\" using 1:2 title \"$title\" with histeps" >>plotcmd

#Execute plot command
gnuplot -persist <plotcmd
