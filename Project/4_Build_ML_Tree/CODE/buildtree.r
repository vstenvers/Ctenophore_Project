#! /usr/bin/env Rscript

# ----------------------------------------------------------------------------------------------
# Script: Build maximum likelihood tree matched18s.fas, matched18sFYY.fas
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
#    9. Print best evolutionary substitution model for distance matrix to screen
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

m18s <- read.dna("~/Ctenophore_Project/Project/4_Build_ML_Tree/DATA/out_m18s.aln", format="clustal")

m18sFYY <- read.dna("~/Ctenophore_Project/Project/4_Build_ML_Tree/DATA/out_m18sFYY.aln", format="clustal")




# 3. Define phyDat variables -------------------------------------------------------------------

m18s_phyD <- phyDat(m18s, type = "DNA", levels = NULL)
m18sFYY_phyD <- phyDat(m18sFYY, type = "DNA", levels = NULL)





# 4. Test best model for distance matrix -------------------------------------------------------

mt18s <- modelTest(m18s_phyD)
mt18sFYY <- modelTest(m18sFYY_phyD)

# Best model will be printed to the screen at the end of the script





# 5. Make distance matrix -----------------------------------------------------------------------
# Unfortunately, the dist.ml command can only use limited models
# Therefore, we will use the JC69 model for now

m18s_dist <- dist.ml(m18s_phyD, model="JC69")
m18sFYY_dist <- dist.ml(m18sFYY_phyD, model="JC69")




# 6. Build neigbour joining tree ----------------------------------------------------------------
# To be used for the maximum likelihood tree

m18s_NJ <- NJ(m18s_dist)
m18sFYY_NJ <- NJ(m18sFYY_dist)





# 7. Bootstrapping and building the ML Tree -----------------------------------------------------
# pml() computes the likelihoof of our NJ trees

fit18s <- pml(m18s_NJ, m18s_phyD)
fit18sFYY <- pml(m18sFYY_NJ, m18sFYY_phyD)


# optim.pml() will optimize tree topology and 
# branch length for the selected distance matix model 
# NB The best evolutionary substitution model for our sequences is the HKY+I
# --> optim.pml() does not accept G and I options, 
# --> Consequently, HKY is used

fit18s_HKY <- optim.pml(fit18s, model = "HKY", rearrangement = "stochastic")  
fit18sFYY_HKY <- optim.pml(fit18sFYY, model = "HKY", rearrangement = "stochastic")  
  

# Use logLik to transform data

logLik(fit18s_HKY)
logLik(fit18sFYY_HKY) 
 

# Bootstrapping

bs18s <- bootstrap.pml(fit18s_HKY, bs=100, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))

bs18sFYY <- bootstrap.pml(fit18sFYY_HKY, bs=100, optNni=TRUE, multicore=TRUE, control = pml.control(trace=0))





# 8. Print ML to PDF file ------------------------------------------------------------------------


pdf("ML_18s.pdf")
plotBS(midpoint(fit18s_HKY$tree), bs18s, p = 50, type="p") 
dev.off()

pdf("ML_18sFYY.pdf")
plotBS(midpoint(fit18sFYY_HKY$tree), bs18sFYY, p = 50, type="p") 
dev.off()





# 9.  Print best model distance matrix ----------------------------------------------------------
# Print evolutionary substitution model to screen

model18s = mt18s[which(mt18s$BIC == min(mt18s$BIC)),1]
sprintf("Best distance matrix model for 18s rRNA: %s", model18s)

model18sFYY = mt18sFYY[which(mt18sFYY$BIC == min(mt18sFYY$BIC)),1]
sprintf("Best distance matrix model for putative isopenicillin-N-synthase matched to 18s rRNA: %s", model18sFYY)

sprintf("Best distance matrix model can be substituted within the optim.pml() function (~/Ctenophore_Project/4_Build_ML_Tree/CODE/buildtree.r -> step 8) for buiding the best ML tree. NB function cannot process G and I options") 


