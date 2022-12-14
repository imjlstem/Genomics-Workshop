#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=busco-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load miniconda/busco 

busco -m genome -i ecoli_hiseq_spades/scaffolds.fasta -o Hiseq_busco --auto-lineage-prok
