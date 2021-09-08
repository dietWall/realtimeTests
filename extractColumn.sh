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
	esac
done


cat $inputfilename | awk -v COL=$column '{ print $COL }' > $outputfilename