#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=speciespaf-result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load R/4.0.2

Rscript pafCoordsDotPlotly.R -i AriAges_VanCard.paf -o ColCroc_AriAges.out -s -t -m 1500 -q 500000
