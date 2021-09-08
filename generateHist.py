#! python3

import sys, getopt
import csv





def main(argv):
    inputfile = 'max.txt'
    outputfile = 'hist.txt'
    column = 0
    try:
        opts, args = getopt.getopt(argv,"i:o:")
    except getopt.GetoptError:
        print('test.py -i <inputfile> -o <outputfile>')
        sys.exit(2)


    for opt, arg in opts:
        if opt == '-i': 
            inputfile = arg
            print("inputfile=" + inputfile)
        elif opt == '-o':
            outputfile = arg
            print("outputfile=" + inputfile)

    f = open(inputfile, 'r')
    lines = f.readlines()
    numbers = list()

    max = 0

    for line in lines:
        n=float(line[0:len(line) - 1 ])
        i=int(n)
        numbers.append(i)
        if i > max:
            max = i
    
    print("max = " + str(max))
    hist = [0]*(max+1)
    print(len(hist))

    for nmb in numbers:
        hist[nmb] += 1
    
    with open(outputfile, 'w') as outfile:
        for nmb in hist:
            outfile.write("%s\n" % nmb)


if __name__ == "__main__":
    main(sys.argv[1:])