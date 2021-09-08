#! /bin/bash

inputfilename=table.txt
outputfilename=hist.txt
column=0

while getopts i:o:c: flag
do
	case "${flag}" in
		i) inputfilename=${OPTARG};;
        o) outputfilename=${OPTARG};;
		c) column=${OPTARG};;
        t) title=${OPTARG};;
	esac
done

#awkstatement="print \$$column"
#echo $awkstatement

cat $inputfilename | awk -v COL=$column '{ print $COL }' > $outputfilename