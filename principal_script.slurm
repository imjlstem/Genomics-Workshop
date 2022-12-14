#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=00:10:00

module load jellyfish/2.3.0
module load R/4.1.3

#jellyfish count -t 20 -m21 -C -s 10G -o ecoli_HiSeqX.jf21 /home/taller-2019/Workshop_materials/SRR18106304.fastq
#jellyfish histo -o ecoli_HiSeqX.histo ecoli_HiSeqX.jf21
Rscript genomescope.R ecoli_HiSeqX.histo 21 150 hiseq_genomescope
