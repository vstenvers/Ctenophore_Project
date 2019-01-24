# Folder: Match Sequences, Comparative study of Ctenophore phylogeny

*Authors: S. Koning and V. Stenvers*

*Purpose: Compare ctenophore phylogenies, based on two different genes.*

Current step in the program:
1. The putative isopenicillin-N-synthase genes from NCBI (Francis et al. 2015, Plos ONE)
2. Download 18s rRNA sequences from NCBI
3. **Match sequences from both markers (i.e. to create two trees based on the same number of species)**
4. Build maximum likelihood (ML) trees based on both markers
5. Combine both markers and again build a ML tree


## Current folder: Match putative isopenicillin-N-synthase (FYY) and 18s rRNA sequences
Script: CODE/match_18s_to_FYY.sh
- Create a search file, based on the FYY sequence
- Use this search file to find the corresponding 18s rRNA sequences

Input = 1_Format_Iso_Sequences/RESULTS/FYY.fas 
Input = 1_Format_18s_Sequences/RESULTS/18s.fas
Output = DATA/samplesearch18s.txt
Output = RESULTS/matched18s.fas

Script: CODE/match_FYY_to18s.sh
- Create a search file, based on the matched 18s rRNA sequences (the two gene trees should contain the same species)
- Use this seatch file to select the corresponding Isopenicillin-N-Synthase (FYY) sequences

Input = RESULTS/matched18s.fas 
Input = DATA/FYY.fas
Output = DATA/samplesearchFYY.txt
Output = RESULTS/matched18sFYY.fas


Clone us:
```
git clone https://github.com/vstenvers/GitHub_test.git
git clone https://github.com/sashakoning/GitHub_test.git
```


![nu](https://nu.aeon.co/images/5b19939d-0481-40b2-b052-579869db8a7b/header_essay-nationalgeographic_431896.jpg)

[Visit Sasha](https://github.com/sashakoning)
[Visit Vanessa](https://github.com/vstenvers)
