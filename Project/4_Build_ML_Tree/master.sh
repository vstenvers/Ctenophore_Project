#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Master script: Build maximum likelihood tree matched18s.fas and matchedFYY.fas
# Purpose: 1. Link 3_Match_seq/*.fas to /DATA
#	   2. Execute script from CODE directory
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 23-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Link 3_Match_Sequences/RESULTS/*.fas to /DATA -----------

ln -s ~/Ctenophore_Project/Project/3_Match_Sequences/RESULTS/*.fas ~/Ctenophore_Project/Project/4_Build_ML_Tree/DATA/.


# 2. Execute scripts in CODE directory
./CODE/alignseq.sh
./CODE/buildtree.r

# Move PDF ML Trees to RESULTS directory
mv *.pdf ~/Ctenophore_Project/Project/4_Build_ML_Tree/RESULTS/.






