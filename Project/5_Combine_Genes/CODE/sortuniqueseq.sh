#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Sort unique sequences using the sortseq.py script
# Purpose: Sort unique sequences, as we want to combine putative-N-isopenicillin and 18s rRNA
#  	   (the fasta files need to be in the same order)
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------



# Sort sequences using sortseq.py --------------------------------------------------------------	
# Copy unique_sequence.py to DATA dirctory to be executed on correct files
cp ~/Ctenophore_Project/Project/5_Combine_Genes/CODE/sortseq.py DATA/.

# Change directory to DATA 
cd ~/Ctenophore_Project/Project/5_Combine_Genes/DATA

# Execute uniqe_sequence.py
python sortseq.py unique18s.fas > sorted18s.fas

python sortseq.py unique18sFYY.fas > sorted18sFYY.fas

#NB Sequences are returned without ">" at the start of the header, which we need to add again:

perl -p -i -e s'/(\w+\_\w+\n)/\>\1/g' sorted18s.fas 

perl -p -i -e s'/(\w+\_\w+\n)/\>\1/g' sorted18sFYY.fas 
