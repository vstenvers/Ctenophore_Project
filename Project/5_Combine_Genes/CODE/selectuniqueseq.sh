#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Select unique sequences using the unique_sequence.py script
# Purpose: Select unique sequences, as we want to combine putative-N-isopenicillin and 18s rRNA
#  	   (the fasta files need to contain the same sequences)
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------



# Select unique sequences using unique_sequence.py ---------------------------------------------
# Copy unique_sequence.py to DATA dirctory to be executed on correct files
cp ~/Ctenophore_Project/Project/5_Combine_Genes/CODE/unique_sequence.py DATA/.

# Change directory to DATA 
cd ~/Ctenophore_Project/Project/5_Combine_Genes/DATA

# Execute uniqe_sequence.py
python unique_sequence.py tocombine18s.fas unique18s.fas

python unique_sequence.py tocombine18sFYY.fas unique18sFYY.fas


