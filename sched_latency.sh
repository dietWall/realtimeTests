#!/bin/bash

#parameters for testing:
threadpriority=99
loops=1000
interval=100
clock=CLOCK_REALTIME
cyclictestoutputfile=cyclic_hist.txt
duration=1h

while getopts p:l:i:c:f:d: flag
do
	case "${flag}" in
		p) threadpriority=${OPTARG};;
		l) loops=${OPTARG};;
		i) interval=${OPTARG};;
		c) clock=${OPTARG};;
		f) cyclictestoutputfile=${OPTARG};;
		d) duration=${OPTARG};;
	esac
done

echo "starting test with: -t -p${threadpriority} -i${interval} -c${clock} -m -h20000 -q -N -D${duration}" > testparams.txt
echo "starting test with: -t -p${threadpriority} -i${interval} -c${clock} -m -h20000 -q -N -D${duration}"



# 1. Run cyclictest
cyclictest -t -p${threadpriority} -i${interval} -c${clock} -m -h20000 -q -N -D${duration} >${cyclictestoutputfile}



