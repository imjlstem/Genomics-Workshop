#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=gene_models-result.txt
#SBATCH --partition=dribe-long
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load Stringtie/1.3.4 
module load gcc/11.1.0

stringtie -o SRR15042536.gff SRR15042536.sorted.bam
