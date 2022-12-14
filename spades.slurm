#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=spadesresult.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load SPAdes/3.7.1

spades.py -s SRR18106304.fastq -o ecoli_hiseq_spades 
