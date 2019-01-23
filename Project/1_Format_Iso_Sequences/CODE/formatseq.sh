#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Remove unwanted sequences and format layout
# Purpose: 1. Remove partial and photoprotein sequences, 
# 	      creating a new file in /DATA, output = isopen.fas
# 	   3. Format header and connect individual sequences in 1 line
#   	   4. Split isopen.fas into the three non-heme oxygenase sequences 
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 23-01-2019

# ----------------------------------------------------------------------------------------------




# 1. Remove photoprotein and partial sequences using a grep ------------------------------------  
# and link the query to a new file: isopen.fas
# First, however, cd to DATA directory, as the new file needs to be created here

cd ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/DATA

agrep -d "\>" -v photoprotein ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/DATA/putativeisopenicillin.fas | agrep -d "\>" -v partial  > isopen.fas





# 2. Format header and connect individual sequences into 1 line --------------------------------
# Format header to include species and non-heme oxygenase type

perl -p -i -e 's/(\>\w\w\d+)\.1\s(\w+)\s(\w+)(\.\s)*(\w+)*\s.+\s(\w+)\_(\w+).+/\1_\2_\3_\5_\7/g' isopen.fas

# Some sequences already contain an underscore, resulting in double "__". 
# These also need to be removed
perl -p -i -e 's/\_\_/\_/g' isopen.fas

# Sequences are split across lines, therefore we have to remove line endings:
perl -p -i -e 's/([AGTC])\n/\1/g' isopen.fas 
# The line headings preceding the headers were also removed, so we need to place it back:
perl -p -i -e 's/(\>.+)/\n\1/g' isopen.fas 





# 3. Separate isopen.fas into FFY, OGFe1 and OGFe2 files----------------------------------------- 

cd ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/RESULTS

agrep -d "\>" -v OGFe ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/DATA/isopen.fas > FYY.fas

agrep -d "\>" -v FYY ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/DATA/isopen.fas | agrep -d "\>" -v OGFe2 > OGFe1.fas

agrep -d "\>" -v FYY ~/Ctenophore_Project/Project/1_Format_Iso_Sequences/DATA/isopen.fas | agrep -d "\>" -v OGFe1 > OGFe2.fas

