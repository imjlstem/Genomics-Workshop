#!/bin/bash
#SBATCH --job-name=Genome-alingment
#SBATCH --output=Genome-alingment.out
#SBATCH --partition=dribe
#SBATCH --ntasks=72
#SBATCH --time=72:00:00



################### 7.1 Genome alingment  #####################

minimap2 -PD -x asm5 -t 16 GCF_905147365.1_ilAriAges1.1_genomic.fna GCF_905220365.1_ilVanCard2.1_genomic.fna  > AriAges_VanCard.paf

################### 7.2 Plot  #####################

##R code
module load R/4.1.3

Rscrip pafCoordsDotPlotly.R -i ColCroc_AriAges.paf -o ColCroc_AriAges.out -s -t -m 1500 -q 500000

date
time 





 


