#!/bin/bash
#SBATCH --job-name=bb_reformat
#SBATCH --output=reformat_result.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=0:10:00

module load bbmap/37.36

srun reformat.sh in1=/home/taller-2019/Workshop_materials/SRR10971019.fastq lhist=HiFi_length.txt
