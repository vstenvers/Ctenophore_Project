# Folder: Format Isopenicillin-N-Synthase sequences, Comparative study of Ctenophore phylogeny

*Authors: S. Koning and V. Stenvers*

*Purpose: Compare ctenophore phylogenies, based on two different genes.*

Current step in the program:
1. **The putative isopenicillin-N-synthase genes from NCBI (Francis et al. 2015, Plos ONE)**
2. Download 18s rRNA sequences from NCBI
3. Match sequences from both markers (i.e. to create two trees based on the same number of species)
4. Build maximum likelihood (ML) trees based on both markers
5. Combine both markers and again build a ML tree


## Current folder: Format Isopenicillin-N-Synthase sequences
Script: CODE/formatseq.sh
- Format the header of the sequences downloaded from NCBI into sequence number, species name and gene type.
- Additionally, the individual sequences are placed on one line.
- Lastly, the putative isopenicillin-N-synthase sequences are split into the non-heme oxygenase groups (the sequences of interest contain the FYY amino acid motif, and will be used troughout the program).

Input = Data_Directory/putativeisopenicillin.fas (raw data)
Output = DATA/isopen.fas (with formatted header)
Output = RESULTS/FYY.fas (sequences of interest)
Output = RESULTS/OGFe1.fas (non-heme oxygenase group)
Output = RESULTS/OGFe2.fas (non-heme oxygenase group)


Clone us:
```
git clone https://github.com/vstenvers/GitHub_test.git
git clone https://github.com/sashakoning/GitHub_test.git
```


![nsf](https://www.nsf.gov/news/mmg/media/images/Haddock_Bathyctena_chuni.jpeg)

[Visit Sasha](https://github.com/sashakoning)
[Visit Vanessa](https://github.com/vstenvers)
