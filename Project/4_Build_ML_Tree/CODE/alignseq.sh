#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Align sequences matched*.fas files
# Purpose: 1. Optionally, install clustalw
#	   2. Align sequences
# 	  	- output matched18s.fas = out_m18s.aln
# 		- output matched18sFYY.fas = out_m18sFYY.aln
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 23-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Install clustalw (optional) ---------------------------------------------------------------

#sudo apt install clustalw



# 2. Align sequences ---------------------------------------------------------------------------
cd ~/Ctenophore_Project/Project/4_Build_ML_Tree/DATA


##### matched18s.fas ######
clustalw -ALIGN -INFILE=matched18s.fas -TYPE=DNA -OUTFILE=out_m18s.aln

##### matched18sFYY.fas #####
clustalw -ALIGN -INFILE=matched18sFYY.fas -TYPE=DNA -OUTFILE=out_m18sFYY.aln



