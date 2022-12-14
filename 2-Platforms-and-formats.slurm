#!/bin/bash
#SBATCH --job-name=2-platforms-and-formats
#SBATCH --output=2-platforms-and-formats.out
#SBATCH --partition=dribe
#SBATCH --ntasks=72
#SBATCH --time=72:00:00

module load sra-toolkit/2.11.0 

fasterq-dump SRR18106304
fasterq-dump SRR10971019
fasterq-dump ERR1674581

date
time 





 


