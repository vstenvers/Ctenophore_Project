#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Master script: Combine putative isopenicillin-N-synthase and 18s RNA and 
#	         build maximum likelihood tree (NB biologically incorrect)
# Purpose: 1. Link 3_Match_seq/*.fas to /DATA
#	   2. Execute script from CODE directory
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 23-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Link 3_Match_Sequences/RESULTS/matches18s.fas and matched18sFYY.fas to /DATA --------------

ln -s ~/Ctenophore_Project/Project/3_Match_Sequences/RESULTS/*.fas ~/Ctenophore_Project/Project/5_Combine_Genes/DATA/.


# 2. Execute scripts in CODE directory ---------------------------------------------------------
./CODE/formatheader.sh

mv *.fas DATA/. # move created output to DATA directory

./CODE/selectuniqueseq.sh
./CODE/sortuniqueseq.sh
./CODE/combineseq.sh
./CODE/alignseq.sh
./CODE/buildtree.r

# Move PDF ML Trees to RESULTS directory
mv *.pdf ~/Ctenophore_Project/Project/5_Combine_Genes/RESULTS/.

