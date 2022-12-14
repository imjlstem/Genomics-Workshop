#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=pluxy_sorting-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load samtools/git
module load samtools/1.9

samtools sort -o SRR15042536.sorted.bam SRR15042536.sam
samtools index SRR15042536.sorted.bam
