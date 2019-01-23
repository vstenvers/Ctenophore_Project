#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Align sequences from combined.fas 
# Purpose: 1. Optionally, install clustalw
#	   2. Align sequences
# 	  	- output combined.fas = out_combined.aln
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Install clustalw (optional) ---------------------------------------------------------------

#sudo apt install clustalw



# 2. Align sequences ---------------------------------------------------------------------------
cd ~/Ctenophore_Project/Project/5_Combine_Genes/DATA


##### matched18s.fas ######
clustalw -ALIGN -INFILE=combined.fas -TYPE=DNA -OUTFILE=out_combined.aln



