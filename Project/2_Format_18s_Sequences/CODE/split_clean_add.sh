#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Clean sequences 18s+ITS rRNA sequences and add them to 18s.fas
# Purpose: 1. Split 18spodar.fas at 1802 bp to remove ITSs, output = out18spodar.fas
#	   2. Remove the ITS sequences using a python sequence cleaner script
# 	   3. Add the cleaned 18s rRNA sequences to 18s.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Split 18spodar.fas and add cleaned sequences to 18s.fas -----------------------------------
# First, split the sequences in the RESULTS directory

cd ~/Ctenophore_Project/Project/2_Format_18s_Sequences/RESULTS
splitter -sequence 18spodar.fas -size 1802 -outseq out18spodar.fas

# Sequences are split across lines, therefore we have to remove line endings:
perl -p -i -e 's/([AGTCRNY])\n/\1/g' out18spodar.fas 
# The line headings preceding the headers were also removed, so we need to place it back:
perl -p -i -e 's/(\>.+)/\n\1/g' out18spodar.fas
# The header was recreated with some extra numbers, which need to be removed
perl -p -i -e s'/(\>\w\w\d+)\_(\w+)_(\w+)\_(18s\_rRNA).+/\1_\2_\3_18s_rRNA/g' out18spodar.fas





# 2. Use the sequencecleaner to remove ITS from 18spodar sequences -----------------------------
# The sequence cleaner asks for [1] the fasta file = 18spodar.fas
# 		                [2] the minimum length = 1802
# 		 	        [3] the % of N allowed = 100
#			           --> output = clear_out18spodar.fas


python sequencecleaner.py 18spodar.fas 1802 100




# 3. Add sequences to 18s.fas ------------------------------------------------------------------

cat clear_out18spodar.fas >> 18s.fas


