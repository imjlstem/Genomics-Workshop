#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=pluxy_map-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load hisat2/2.0.3-beta

hisat2 -S SRR15042536.sam -p 10 --rna-strandness=FR -x GCF_932276165.1_ilPluXylo3.1_genomic_hisat2_index -1 SRR15042536_1.fastq -2 SRR15042536_2.fastq
