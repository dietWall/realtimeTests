# realtimeTests
Several Scripts for Realtime testing a Kernel

This Repo contains some scripts for realtime testing a kernel,
additionally some helper scripts for diagram generation, used for my master thesis

Dependencies (available as debian package):  
cyclictest (debian: rt-tests)  
gnuplot 
python3

Scripts:  
sched_latency.sh  
Tests the realtime behaviour of the kernel of a Linux system, generates a plot with gnuplot  
Parameters:  (default value)  
	-t Number of cyclictest threads to run (4)  
	-p highest thread priority (99)  
	-l number of loops (1000)  
	-i sleep time for each cyclictest thread in us (100)  
	-c CLOCK_REALTIME/CLOCK_MONOTONIC (CLOCK_REALTIME)  
	-f output file for cyclictest (test_output)  
		name each output with parameters for better result management  


extractColumn.sh
	extracts a specific column from a file

generateHist.py
	generates a histogram from a raw data file

createPlotCmd_hist.py
	creates a plotcmd for gnuplot diagram
	usage of generated plotcmd:
	$gnuplot --persist < plotcmd