#!/bin/bash
#SBATCH --job-name=Homology-gene-annotation
#SBATCH --output=Homology-gene-annotation.out
#SBATCH --partition=dribe
#SBATCH --ntasks=72
#SBATCH --time=72:00:00



miniprot -t8 --gff GCF_932276165.1_ilPluXylo3.1_genomic.fna Masc_multiSpecies_aa.fasta > prot1.gff
miniprot  -n 3 -s 3 -k 5 -l 3 -j 1 -t8 --gff GCF_932276165.1_ilPluXylo3.1_genomic.fna Masc_multiSpecies_aa.fasta > prot2.gff



date
time 





 


