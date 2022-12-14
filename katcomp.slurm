#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=katcomp-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load miniconda/kat 

kat comp -t 16 -o SRR18106304_vs_spades SRR18106304.fastq ecoli_hiseq_spades/scaffolds.fasta

