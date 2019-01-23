#! /bin/bash

# --------------------------------------------------------------------------------------------
# Clean script
# Purpose: Removes DATA and RESULTS folders from the Project subdirectories
# Author: Sasha Koning and Vanessa Stenvers
# Last modified on: 22-01-2019

# --------------------------------------------------------------------------------------------

for d in 1_Format_Iso_Sequences 2_Format_18s_Sequences 3_Match_Sequences 4_Build_ML_Tree 5_Combine_Genes; do
	cd $d
	for i in DATA RESULTS; do
		rm -rf $i
	done
	cd ../
done
