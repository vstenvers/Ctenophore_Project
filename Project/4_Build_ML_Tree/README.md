# Folder: Build ML Tree, Comparative study of Ctenophore phylogeny

*Authors: S. Koning and V. Stenvers*

*Purpose: Compare ctenophore phylogenies, based on two different genes.*

Current step in the program:
1. The putative isopenicillin-N-synthase genes from NCBI (Francis et al. 2015, Plos ONE)
2. Download 18s rRNA sequences from NCBI
3. Match sequences from both markers (i.e. to create two trees based on the same number of species)
4. **Build maximum likelihood (ML) trees based on both markers**
5. Combine both markers and again build a ML tree


## Current folder: Build Maximum Likelihood (ML) trees based on matched FYY and 18s rRNA sequences
Script: CODE/alignseq.sh
- Align the matched sequences (matched18s.fas and matched18sFYY.fast) with clustalw

Input = 3_Match_Sequences/RESULTS/matched18s.fas 
Input = 3_Match_Sequences/RESULTS/matched18sFYY.fas
Output = DATA/out_m18s.aln
Output = DATA/out_m18sFYY.aln

Script: CODE/buildtree.r
- Import aligned sequences from /DATA directory
- Define phyDat variables
- Test best model for distance matrix
- Make distance matrix, using default JC69 model (to be used in ML tree)
- Build Neighbour Joining tree (to be used for optimising ML tree)
- Bootstrap and build ML tree
- Print ML to PDF file

Input = out_m18s.aln
Input = out_m18sFYY.aln
Output = RESULTS/ML_18s.pdf 
Output = RESULTS/ML_18sFYY.pdf


Clone us:
```
git clone https://github.com/vstenvers/GitHub_test.git
git clone https://github.com/sashakoning/GitHub_test.git
```


![media](https://media.wired.com/photos/59323e9344db296121d69e0d/16:9/w_3872,c_limit/haeckelia-rubra.jpg)

[Visit Sasha](https://github.com/sashakoning)
[Visit Vanessa](https://github.com/vstenvers)
