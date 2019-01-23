#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Master script: Link data and execute scripts /CODE
# Purpose: 1. Link FYY.fas to /DATA 
#             Link 18s.fas to /DATA
#	      Link 18sITS.fas to /DATA
#	   2. Execute scripts from CODE directory
# 		- Match FYY to 18s and 18ITS.fas, 
#		  output = matched18s.fas and matched18sITS.fas
# 		- Match 18s and 18sITS to FYY.fas
# 		  output = matched18sFYY.fas and matched18sITSFYY.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 22-01-2019

# ----------------------------------------------------------------------------------------------



# 1. Link Format_Iso_seg/RESULTS/FYY.fas and Format_18s_seq/RESULTS/18s.fas to /DATA -----------

# Link FYY.fas
ln -s ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/RESULTS/FYY.fas ~/Ctenophore_Project/Project/3_Match_Sequences/DATA/.

# Link 18s.fas 
ln -s ~/Ctenophore_Project/Project/2_Format_18s_Sequences/RESULTS/18s.fas ~/Ctenophore_Project/Project/3_Match_Sequences/DATA/.





# 2. Execute scripts from CODE directory -------------------------------------------------------

./CODE/match_FYY_to_18s.sh  # creates search file and matches FYY to 18s and 18sITS seq.
./CODE/match_18s_to_FYY.sh  # creates search file and matches 18s and 18sITS to FYY seq.





