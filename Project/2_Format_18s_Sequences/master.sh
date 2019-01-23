#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Master script: Link Data_Repository and execute scripts /CODE
# Purpose: 1. Link 18srrna.fas to /DATA and connect individual sequences into 1 line
#	   2. Execute scripts from CODE directory
# 		- Extract 18s rRNA sequences, output = 18s.fas
# 		- Extract 18s+ITS rRNA sequences from Podar et al. 2001, output = 18spodar.fas
# 	   3. Split 18spodar.fas at 1802 bp to remove ITSs, output = out18spodar.fas
#	      Then remove the ITS sequences using a python sequence cleaner script
# 	      and add the cleaned 18s rRNA sequences to 18s.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 22-01-2019

# ----------------------------------------------------------------------------------------------




# 1. Link putativeisopenicillin.fas in DATA_REPOSITORY to /DATA --------------------------------
# Create a link and move into corresponging RESULTS directory
# Then, use the perl command + regexp to connect individual sequences into 1 line

ln -s ~/Ctenophore_Project/Data_Repository/18srrna.fas  ~/Ctenophore_Project/Project/2_Format_18s_Sequences/DATA/. 

cd ~/Ctenophore_Project/Project/2_Format_18s_Sequences/DATA

perl -p -i -e 's/([AGCTRN])\n/\1/g' 18srrna.fas
perl -p -i -e 's/(\>.+)/\n\1/g' 18srrna.fas 




 
# 2. Execute scripts from CODE directory -------------------------------------------------------
# Change directory back to main folder to access /CODE

cd ~/Ctenophore_Project/Project/2_Format_18s_Sequences

./CODE/create_18s_seq.sh  	# creates 18s.fas
./CODE/reformat18sITS.sh 	# select sequences from Podar et al. 2001 with ITS in sequence

# Copy sequencecleaner.py to RESULTS dirctory to be executed during split_clean_add.sh
cp ~/Ctenophore_Project/Project/2_Format_18s_Sequences/CODE/sequencecleaner.py RESULTS/.
./CODE/split_clean_add.sh





