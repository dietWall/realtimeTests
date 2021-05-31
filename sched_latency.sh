#!/bin/bash

#parameters for testing:
threadpriority=99
loops=1000
interval=100
clock=CLOCK_REALTIME
cyclictestoutputfile=cyclic_hist.txt

while getopts p:l:i:c:f: flag
do
	case "${flag}" in
		p) threadpriority=${OPTARG};;
		l) loops=${OPTARG};;
		i) interval=${OPTARG};;
		c) clock=${OPTARG};;
		f) cyclictestoutputfile=${OPTARG};;
	esac
done

# 1. Run cyclictest
cyclictest -t -p${threadpriority} -l${loops} -i${interval} -c${clock} -m -h20000 -q -N >${cyclictestoutputfile}



