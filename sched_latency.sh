#!/bin/bash

#parameters for testing:
threads=4
threadpriority=99
loops=1000
interval=100
clock=CLOCK_REALTIME
cyclictestoutputfile=test_output

while getopts t:p:l:i:c flag
do
	case "${flag}" in
		t) threads=${OPTARG};;
		p) threadpriority=${OPTARG};;
		l) loops=${OPTARG};;
		i) interval=${OPTARG};;
		c) clock=${OPTARG};;
		f) cyclictestoutputfile=${OPTARG};;
	esac
done

# 1. Run cyclictest
cyclictest -t${threads} -p${threadpriority} -l${loops} -i${interval} -c${clock} -m -h400 -q >${cyclictestoutputfile}



