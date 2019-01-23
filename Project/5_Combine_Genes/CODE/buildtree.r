#! /usr/bin/env Rscript

# ----------------------------------------------------------------------------------------------
# Script: Build maximum likelihood tree combined.fas
# Purpose: 1. Install the packages (optionally) and load library:
# 	       - Ape
#  	       - Phangorn
# 	       - Seqinr
#	   2. Import aligned sequences from /DATA directory
#	   3. Define phyDat variables
# 	 4. Test best model for distance matrix
#	   5. Make distance matrix, using default JC69 model
# 	      --> to be used in ML tree
#	   6. Build Neighbour Joining tree
# 	 7. Bootstrap and build ML tree
# 	      --> Evolutionary model can be adjused depending on output step 5
# 	 8. Print ML to PDF file
#    9. Make dendogram cophylogeny
#	   10. Print best evolutionary substitution model for distance matrix to screen
# 	  
# Authors: Sasha Koning and Vanessa Stenvers
# Last modified on: 24-01-2019

# ----------------------------------------------------------------------------------------------





# 1. Install packages (optional) and load library ----------------------------------------------

#install.packages("ape")
#install.packages("phangorn")
#install.packages("seqinr")
library(ape)
library(phangorn)
library(seqinr)




# 2. Import aligned sequences in /DATA ---------------------------------------------------------

combined <- read.dna("~/Ctenophore_Project/Project/5_Combine_Genes/DATA/out_combined.aln", format="clustal")




# 3. Define phyDat variables -------------------------------------------------------------------

com_phyD <- phyDat(combined, type = "DNA", levels = NULL)





# 4. Test best model for distance matrix -------------------------------------------------------

mtcom <- modelTest(com_phyD)

# Best model will be printed to the screen at the end of the script





# 5. Make distance matrix -----------------------------------------------------------------------
# Unfortunately, the dist.ml command can only use limited models
# Therefore, we will use the JC69 model for now

com_dist <- dist.ml(com_phyD, model="JC69")




# 6. Build neigbour joining tree ----------------------------------------------------------------
# To be used for the maximum likelihood tree

com_NJ <- NJ(com_dist)





# 7. Bootstrapping and building the ML Tree -----------------------------------------------------
# pml() computes the likelihoof of our NJ trees

fitcom <- pml(com_NJ, com_phyD)


# optim.pml() will optimize tree topology and 
# branch length for the selected distance matix model 
# NB The best evolutionary substitution model for our sequences is the HKY+I
# --> optim.pml() does not accept G and I options, 
# --> Consequently, HKY is used

fitcom_HKY <- optim.pml(fitcom, model = "HKY", rearrangement = "stochastic")  
  

# Use logLik to transform data

logLik(fitcom_HKY)
 

# Bootstrapping

bscom <- bootstrap.pml(fitcom_HKY, bs=100, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))





# 8. Print ML to PDF file ------------------------------------------------------------------------


pdf("ML_combined_genes.pdf")
plotBS(midpoint(fitcom_HKY$tree), bscom, p = 50, type="p") 
dev.off()






# 9. Print best model distance matrix ----------------------------------------------------------
# Print evolutionary substitution model to screen

modelcom = mtcom[which(mtcom$BIC == min(mtcom$BIC)),1]
sprintf("Best distance matrix model for combined genes: %s", modelcom)

sprintf("Best distance matrix model can be substituted within the optim.pml() function (~/Ctenophore_Project/5_Combine_Genes/CODE/buildtree.r -> step 8) for buiding the best ML tree. NB function cannot process G and I options") 


