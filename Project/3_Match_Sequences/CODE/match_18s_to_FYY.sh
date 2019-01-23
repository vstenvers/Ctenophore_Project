#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Purpose: Match sequences 18s.fas to FYY.fas
# Script : 1. Create search file to match sequences, 
# 	      output = samplesearch18s.txt
# 	   2. Match sequences
#	       - 18s.fas FYY, output = matched18sFYY.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 22-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Create search file (from FYY.fas motifs) to match sequences -------------------------------
# Change directory to DATA to create file there
# Use the matchedseq-files created in the first script (found in the RESULTS directory)
#    --> matched18s.fas output = samplesearch18s.txt

cd ~/Ctenophore_Project/Project/3_Match_Sequences/DATA

grep ">" ~/Ctenophore_Project/Project/3_Match_Sequences/RESULTS/matched18s.fas | cut -f 2,3 -d "_" | uniq -i > samplesearch18s.txt

# Side note: cut -f 2,3 --> the 2nd and 3rd column include the species names



# 2. Find names from samplesearchFYY.fas in 18s.fas ---------------------------------------------
# 	- Match 18s to FYY.fas
# Matching sequences can be done using grep -Ff 
# -F = Interpreted pattern as a list of strings, any of which is to be matched
# -i = case insensitive search
# -f = Obtain patterns from file


grep -Ff samplesearch18s.txt -A1 FYY.fas > ~/Ctenophore_Project/Project/3_Match_Sequences/RESULTS/matched18sFYY.fas


# The output is now separated by "--", which we can remove using perl and regexp:
# First, change directory to results, as the file is created there
cd ~/Ctenophore_Project/Project/3_Match_Sequences/RESULTS

perl -p -i -e s'/\-\-\n//g' matched18sFYY.fas 





