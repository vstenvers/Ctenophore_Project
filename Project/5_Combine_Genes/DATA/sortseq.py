#! /usr/bin/env python

# ----------------------------------------------------------------------------------------------
# Script: Sort sequences alphabetically
# Authors: Sasha Koning and Vanessa Stenvers, with special thanks to: 
# (https://stackoverflow.com/questions/10542918/sort-sequence-in-order-from-fasta-file-by-python-program)
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------


import sys


from Bio import SeqIO

handle = open(sys.argv[1], "rU")
l = SeqIO.parse(handle, "fasta")
sortedList = [f for f in sorted(l, key=lambda x : x.id)]
for s in sortedList:
   print s.description
   print str(s.seq)





