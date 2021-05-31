#!/bin/bash
cyclictestoutputfile=cyclic_hist.txt

while getopts f flag
do
	case "${flag}" in
		f) cyclictestoutputfile=${OPTARG};;
	esac
done

#Get maximum latency
max=`grep "Max Latencies" ${cyclictestoutputfile} | tr " " "\n" | sort -n | tail -1 | sed s/^0*//`

#Grep data lines, remove empty lines and create a common field separator
grep -v -e "^#" -e "^$" ${cyclictestoutputfile} | tr " " "\t" >histogram 

#Set the number of cores, for example
cores=$(lscpu | grep 'CPU(s):' | head -n 1 | awk '{print $2}')

echo "Calculation with Number of Cores: ${cores}"

#Create two-column data sets with latency classes and frequency values for each core, for example
for i in `seq 1 $cores`
do
  column=`expr $i + 1`
  cut -f1,$column histogram >histogram$i
done

#Create plot command header
echo -n -e "set title \"Latency plot\"\n\
set terminal png\n\
set xlabel \"Latency (ns), max $max ns\"\n\
set logscale y\n\
set xrange [1000:20000]\n\
set xtics font \" ,6\"\n\
set yrange [0.8:*]\n\
set ylabel \"Number of latency samples\"\n\
set output \"plot.png\"\n\
plot " >plotcmd

#Append plot command data references
for i in `seq 1 $cores`
do
  if test $i != 1
  then
    echo -n ", " >>plotcmd
  fi
  cpuno=`expr $i - 1`
  if test $cpuno -lt 10
  then
    title=" CPU$cpuno"
   else
    title="CPU$cpuno"
  fi
  echo -n "\"histogram$i\" using 1:2 title \"$title\" with histeps" >>plotcmd
done

#Execute plot command
gnuplot -persist <plotcmd
