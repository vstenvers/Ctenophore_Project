#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Master script: Link Data_Repository and remove unwanted sequences
# Purpose: 1. Link putativeisopenicillin.fas to /DATA/.
#	   2. Execute script in CODE directory 
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 21-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Link putativeisopenicillin.fas in DATA_REPOSITORY to /DATA 

ln -s ~/Ctenophore_Project/Data_Repository/putativeisopenicillin.fas  ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/DATA/.


# 2. Execute script in CODE directory
# Script formats header and removes unwanted sequences

./CODE/formatseq.sh
