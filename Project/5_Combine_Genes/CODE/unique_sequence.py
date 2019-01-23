#! /usr/bin/env python

# ----------------------------------------------------------------------------------------------
# Script: Parse unique sequences 
# Purpose: Extract unique sequences to be combined
# 	   Command to run: python unique_sequence.py [1] [2] 
#	   --> [1] = the fasta file to be parsed
# 	   --> [2] = name of new output file
# Author: Yacine Chehida
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------

import os
import time
import sys


from collections import OrderedDict
dct = OrderedDict()
with open(sys.argv[1]) as f:
    for line in f:
        if line == "" or line == "\n": continue
        if line.startswith(">"):
            key = line
        else:
            dct[key] = line

out_file = open(sys.argv[2],"w")
for k in dct.keys():
    out_file.write("%s%s" %(k,dct[k]))
out_file.close()
