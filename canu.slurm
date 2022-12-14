#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=canuresult.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load canu/git

canu -p ecoli -d ecoli-canu useGrid=false genomeSize=4.8m -nanopore-raw ERR1674581.fastq
