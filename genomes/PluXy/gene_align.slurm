#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=gene_align-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load miniprot/0.5

miniprot -t8 --gff GCF_932276165.1_ilPluXylo3.1_genomic.fna Masc_multiSpecies_aa.fasta > prot1.gff
miniprot  -n 3 -s 3 -k 5 -l 3 -j 1 -t8 --gff GCF_932276165.1_ilPluXylo3.1_genomic.fna Masc_multiSpecies_aa.fasta > prot2.gff
