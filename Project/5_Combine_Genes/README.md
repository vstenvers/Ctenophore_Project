# Folder: Combine putative isopenicillin-N-synthase and 18s RNA and build maximum likelihood tree
# Comparative study of Ctenophore phylogeny

*Authors: S. Koning and V. Stenvers*

*Purpose: Compare ctenophore phylogenies, based on two different genes.*

Current step in the program:
1. The putative isopenicillin-N-synthase genes from NCBI (Francis et al. 2015, Plos ONE)
2. Download 18s rRNA sequences from NCBI
3. Match sequences from both markers (i.e. to create two trees based on the same number of species)
4. Build maximum likelihood (ML) trees based on both markers
5. **Combine both markers and again build a ML tree**


## Folder: 
Script: formatheader.sh
- To combine the two genes, format header of matched18s and matched18sFYY 
  files to include species names only

Input = 3_Match_Sequences/RESULTS/matched18s
Input = 3_Match_Sequences/RESULTS/matched18sFYY
Output = DATA/tocombine18s.fas
Output = DATA/tocombine18sFYY.fas

Script: selectuniqueseq.sh
- Select unique sequences to combine putative-N-isopenicillin and 18s rRNA

Input: DATA/tocombine18s.fas
Input: DATA/tocombine18sFYY.fas
Output: DATA/unique18s.fas
Output: DATA/unique18sFYY.fas

Script: sortuniqueseq.sh
- Sort unique sequences to combine putative-N-isopenicillin and 18s rRNA

Input: DATA/unique18s.fas
Input: DATA/unique18sFYY.fas
Output: DATA/sorted18s.fas
Output: DATA/sorted18sFYY.as

Script: combineseq.sh
- Combine sequences to make phylogenetic tree

Input: DATA/sorted18s.fas
Input: DATA/sorted18sFYY.fas 
Output = DATA/combined.fas

Script: alignseq.sh
- Align sequences (combined.fas using clustalw)

Input: DATA/combined.fas
Output: DATA/out_combined.aln

Script: buildtree.r
- Import aligned sequences from /DATA directory
- Define phyDat variables
- Test best model for distance matrix
- Make distance matrix, using default JC69 model (to be used in ML tree)
- Build Neighbour Joining tree
- Bootstrap and build ML tree
- Print ML to PDF file

Input: DATA/out_combined.aln
Output: ML_combined_genes.pdf

Clone us:
```
git clone https://github.com/vstenvers/GitHub_test.git
git clone https://github.com/sashakoning/GitHub_test.git
```


![futureoftheocean](https://futureoftheocean.files.wordpress.com/2018/02/leucothea-adult-horiz.jpg?w=1024)

[Visit Sasha](https://github.com/sashakoning)
[Visit Vanessa](https://github.com/vstenvers)
