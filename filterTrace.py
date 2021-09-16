#! /usr/bin/python3


import sys, argparse
import os
from decimal import *



parser = argparse.ArgumentParser(description='filters trace.dat file for event')
parser.add_argument('--event', type=str,  help='event to filter for')
parser.add_argument('--limit', type=float, help='searches for all times > <limit>')


args=parser.parse_args()

outputTimestamps = os.popen("trace-cmd report | grep " + args.event + " | awk \' { print $3 } \' " ).read()
timestamps=outputTimestamps.split()

print(type(timestamps))
last=Decimal(timestamps[0][:-1])
print(last)

differences = list()
extractedTimestamps = list()

i=0

for line in timestamps[1:]:
    current = Decimal(line[:-1])
    diff = current - last


    if diff > args.limit:
        differences.append(diff)
        extractedTimestamps.append(timestamps[i])

    print(str(diff))
    
    i +=1
    last = current

differences.sort()

print(differences)

for i in range(0, len(differences)):
    print(extractedTimestamps[i] + " : " + str(differences[i]))

