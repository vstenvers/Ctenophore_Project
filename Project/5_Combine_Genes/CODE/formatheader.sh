#! /bin/bash

# ----------------------------------------------------------------------------------------------
# Script: Format header matched18s and matched18FYY files
# Purpose: Format header to include species names only 
# 	   (in order to combine the two genes) 
# 	   output = tocombine18s.fas and tocombine18sFYY.fas
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------



# Format the header to species only, delimited with underscores --------------------------------
# And link the query to a new file: 18s.fas
# First, however, cd to RESULTS directory, as the new file needs to be created here


perl -p -e s'/(\>)\w\w\d+\_(\w+)\_(\w+)\_18.+/\1\2_\3/g' ~/Ctenophore_Project/Project/5_Combine_Genes/DATA/matched18s.fas > tocombine18s.fas

perl -p -e s'/(\>)\w\w\d{6}\_(\w+)\_(\w+)\_(V\_FYY)*.+/\1\2_\3/g' ~/Ctenophore_Project/Project/5_Combine_Genes/DATA/matched18sFYY.fas | perl -p -e s'/(Lobata)\_(sp)\_(V)/\1_\2/g' > tocombine18sFYY.fas

# Side note: Lobata_sp_V needs a special change, as the regexp do not recognise it correctly









