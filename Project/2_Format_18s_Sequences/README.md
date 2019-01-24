# Folder: Formatting the retrieved 18s rRNA sequences, Comparative study of Ctenophore phylogeny 

*Authors: S. Koning and V. Stenvers*

*Purpose: Compare ctenophore phylogenies, based on two different genes.*

Current step in the program:
1. The putative isopenicillin-N-synthase genes from NCBI (Francis et al. 2015, Plos ONE)
2. **Download 18s rRNA sequences from NCBI**
3. Match sequences from both markers (i.e. to create two trees based on the same number of species)
4. Build maximum likelihood (ML) trees based on both markers
5. Combine both markers and again build a ML tree


## Folder: Format 18s sequences and clean sequences using python sequence cleaner
Script: create_18s_seq.sh
- Download 18s rRNA sequences from NCBI
- Create a file containing 18s rRNA sequences only
- Remove undescribed and internal transcribed spacer (ITS) sequences from DATA/18srrna.fas,
- Format the header to contain only the species number, species type and gene

Input = Data_Repository/18srrna.fas
Output = RESULTS/18s.fas

Script: reformat18sITS.sh
- Podar et al. (2001) have specified the exact length of the 18s rRNA sequences (at 1802 bp), allowing us to retrieve them (i.e. ITS).
- Extract correct 18s rRNA+ITS sequences from 18srrna.fas (using seq number)
- Format header to contain species number, species type and gene and create a new file

Input: DATA/18srrna.fas
Output: RESULTS/18spodar.fas

Script: split_and_clean_add.sh
- Clean sequences 18s+ITS rRNA sequences and add them to 18s.fas
- Split 18spodar.fas at 1802 bp to remove ITSs
- Add the cleaned 18s rRNA sequences to 18s.fas

Input: RESULTS/18spodar.fas
Output: RESULTS/out18spodas

Script: sequencecleaner.py
- Cleans sequences of out18spodar.fas by removing short sequences lower than 1802, 
  duplicate sequences and sequences with too many unknown nucleotides (N)
- Use python for the sequence cleaner

Input: RESULTS/out18spodar.fas
Output: RESULTS/clear_out18spodar.fas (is added to 18s.fas) 


Clone us:
```
git clone https://github.com/vstenvers/GitHub_test.git
git clone https://github.com/sashakoning/GitHub_test.git
```


![futureoftheocean](https://futureoftheocean.files.wordpress.com/2018/02/leucothea-adult-horiz.jpg?w=1024)

[Visit Sasha](https://github.com/sashakoning)
[Visit Vanessa](https://github.com/vstenvers)
