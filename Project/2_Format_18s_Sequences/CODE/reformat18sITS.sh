#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Reformat 18s rRNA +ITS sequences from Podar et al. 2001 (Mol.Phylogenet.Evol.)
# Purpose: Podar et al. (2001) have specified the exact length of the 18s rRNA sequences,
#	   allowing us to retrieve them (i.e. without internal transcribed spacers)
# 	   The wanted sequences are numbered from AF293673 to AF293700.
#
# 	   Steps to achieve this include:
# 	   - Extract correct 18s rRNA+ITS sequences from 18srrna.fas (using seq number),
#	   - Format header and create a new file in RESULTS: 18spodar.fas
#	   - See 2_Format_Iso_Seq/master.sh on how to cut sequences correctly
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 22-01-2019

# ----------------------------------------------------------------------------------------------



# Extract 18s rRNA+ITS sequences from 18srrna.fas ------------------------------------------
# Extract internal transcriped sequences (NB keep "spacer", remove "undescribed" species), 
# format header and create file 
# First, however, cd to RESULTS directory, as the new file needs to be created here

cd ~/Ctenophore_Project/Project/2_Format_18s_Sequences/RESULTS 

agrep -d "\>" -i af293 ~/Ctenophore_Project/Project/2_Format_18s_Sequences/DATA/18srrna.fas | agrep -d "\>" -vi undescribed | perl -p -e s'/(\>\w\w\d+)\.\d\s(\w+)\s(\w+).+(18S).+/\1_\2_\3_18s_rRNA/g'  > 18spodar.fas







