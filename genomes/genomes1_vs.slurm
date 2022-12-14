#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=genomes1-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load miniconda/minimap2

minimap2 -PD -x asm5 -t 16 aricia/GCF_905147365.1_ilAriAges1.1_genomic.fna vanessa/GCF_905220365.1_ilVanCard2.1_genomic.fna  > AriAges_VanCard.paf


