#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Combine sorted18s.fas and sorted18sFYY.fas
# Purpose: Combine sequences to make phylogenetic tree
# 	   output = combined.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------


# Change directory to DATA
cd ~/Ctenophore_Project/Project/5_Combine_Genes/DATA


# use awk to combine both files
paste sorted18s.fas sorted18sFYY.fas | awk '{if (NR%2==0) {print $1 $2} else {print $1}}' > combined.fas





