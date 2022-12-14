#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=orthofinder-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load miniconda/orthofinder

orthofinder -f ~/GENOMICS_WORKSHOP/genomes/orthofinder_1

