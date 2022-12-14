#!/bin/bash
#SBATCH --job-name=Assembly
#SBATCH --output=Assembly.out
#SBATCH --partition=dribe
#SBATCH --ntasks=72
#SBATCH --time=72:00:00

module load fastqc/0.11.9
module load SPAdes/3.14.1
module load intelpython/3.7 

################### 4.1 Read QC  #####################

fastqc SRR18106304.fastq

unzip SRR18106304_fastqc.zip
firefox SRR18106304_fastqc.html

bbduk.sh in=SRR18106304.fastq out=SRR18106304_clean.fastq ref=/pub66/samw/bin/miniconda3/envs/CR_workshop/opt/bbmap-39.00-0/resources/adapters.fa ktrim=l k=23 mink=11 hdist=1

################### 4.2 Contig generation  #####################

spades.py -s SRR18106304.fastq -o ecoli_hiseq_spades &

##Bash/command line code
hifiasm -t 16 SRR10971019.fastq -o hifi_ecoli

##Bash/command line code
module load miniconda/3
source activate canu
canu -p ecoli -d ecoli-oxford useGrid=false genomeSize=4.8m -nanopore-raw ERR3890216.fastq




date
time 





 


