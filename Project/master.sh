#! /bin/bash

# -------------------------------------------------------------------------------------------
# Master script Ctenophore Project

# Purpose: 1. Download sequence data from NCBI into Data_Repository
# 		- Putative isopenicillin-N-synthase, output = putativeisopenicillin.fas
# 		- 18s rRNA, output = 18srRNA.fas
# 	   2. Execute all master scripts from the Project subdirectories
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 21-01-2019

# -------------------------------------------------------------------------------------------

# 1. Download sequences NCBI using edirect --------------------------------------------------

########################## Isopenicillin-N-synthase sequences ###############################

# search the NCBI popset database for "putative isopenicillin-N-synthase" 
# and "ctenophora putative".
# Parse sequences into a fasta file
esearch -db popset -query "ctenophora putative isopenicillin-n-synthase" | efetch -format fasta > ~/Ctenophore_Project/Data_Repository/putativeisopenicillin.fas 



################################## 18s rRNA sequences #######################################

# search the NCBI popset database for "Ctenophora tentaculata 18s rna"
# and parse them into a fasta file
esearch -db nucleotide -query "ctenophora tentaculata 18s rna" | efetch -format fasta > ~/Ctenophore_Project/Data_Repository/18srrna.fas



# 2. Execute all master scripts in the Project subfolders 
 
for d in 1_Format_Iso_Sequences 2_Format_18s_Sequences 3_Match_Sequences 4_Build_ML_Tree 5_Combine_Genes; do
	cd $d
	for i in DATA RESULTS; do
		mkdir $i
	done
	./master.sh
	cd ../
done
