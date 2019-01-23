#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Purpose: Match sequences from FYY.fas to 18s.fas
# Script : 1. Create search file to match sequences, 
# 	      output = samplesearchFYY.txt
# 	   2. Match sequences
#	       - FYY to 18s.fas, output = matched18s.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 22-01-2019

# ----------------------------------------------------------------------------------------------




# 1. Create search file (from FYY.fas motifs) to match sequences -------------------------------
# Change directory to DATA to create file there
cd ~/Ctenophore_Project/Project/3_Match_Sequences/DATA

grep ">" ~/Ctenophore_Project/Project/3_Match_Sequences/DATA/FYY.fas | cut -f 2,3 -d "_" | uniq -i > samplesearchFYY.txt




# 3. Find names from samplesearchFYY.fas in 18s.fas and 18sITS.fas -----------------------------
# 	- Match FYY to 18s.fas
# Matching sequences can be done using grep -Ff 
# -F = Interpreted pattern as a list of strings, any of which is to be matched
# -i = case insensitive search
# -f = Obtain patterns from file


grep -Ff samplesearchFYY.txt -A1 18s.fas > ~/Ctenophore_Project/Project/3_Match_Sequences/RESULTS/matched18s.fas


# The output is now separated by "--", which we can remove using perl and regexp:
cd ~/Ctenophore_Project/Project/3_Match_Sequences/RESULTS

perl -p -i -e s'/\-\-\n//g' matched18s.fas 





