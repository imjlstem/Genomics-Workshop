#!/bin/bash
#SBATCH --job-name=pi_threads
#SBATCH --output=hifiasmresult.txt
#SBATCH --partition=nu-wide
#SBATCH --ntasks=1
#SBATCH --time=24:00:00

module load miniconda/hifiasm

hifiasm -t 16 SRR10971019.fastq -o hifi_ecoli
awk '/^S/{print ">"$2;print $3}' hifi_ecoli.p_ctg.fa
