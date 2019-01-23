#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Create file with 18s rRNA sequences only
# Purpose: Remove undescribed and ITS sequences from DATA/18srrna.fas,
# 	   format header 
#          and create a new file in RESULTS, output = 18s.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 22-01-2019

# ----------------------------------------------------------------------------------------------



# Remove undescribed species and ITS sequences using a grep --------------------------------- 
# Format the header to species and DNA type, delimited with underscores
# And link the query to a new file: 18s.fas
# First, however, cd to RESULTS directory, as the new file needs to be created here

cd ~/Ctenophore_Project/Project/2_Format_18s_Sequences/RESULTS

agrep -d "\>" -vi undescribed ~/Ctenophore_Project/Project/2_Format_18s_Sequences/DATA/18srrna.fas | agrep -d "\>" -v spacer | perl -p -e s'/(\>\w\w\d+)\.\d\s(\w+)\s(\w+).+(18S).+/\1_\2_\3_18s_rRNA/g' > 18s.fas







