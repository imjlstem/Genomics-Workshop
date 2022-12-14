#!/bin/bash
#SBATCH --job-name=Preassembly-QC
#SBATCH --output=Preassembly-QC.out
#SBATCH --partition=dribe
#SBATCH --ntasks=72
#SBATCH --time=72:00:00


module load bbools/
module load 
 

################### 3.1 Sequencing coverage #####################

## Bash/command line code
reformat.sh in1=SRR10971019.fastq lhist=HiFi_length.txt

java -ea -Xms300m -cp /pub66/samw/bin/miniconda3/envs/CR_workshop/opt/bbmap-39.00-0/current/ jgi.ReformatReads in1=SRR10971019.fastq lhist=HiFi_length.txt
Executing jgi.ReformatReads [in1=SRR10971019.fastq, lhist=HiFi_length.txt]


## R code

#library(ggplot2)
#HiFi_hist <- read.table("HiFi_length.txt")
#ggplot(data=HiFi_hist,aes(x=V1,y=V2)) + geom_col()


##Bash/command line code

jellyfish count -t 20 -m21 -C -s 10G -o ecoli_HiSeqX.jf21 SRR18106304.fastq
jellyfish histo -o ecoli_HiSeqX.histo ecoli_HiSeqX.jf21


##R code
library(ggplot2)
HiSeq_kmers <- read.table("ecoli_HiSeqX.histo")
#you may need to adjust the x and y axis limits, depending on the data.
ggplot(data=HiSeq_kmers,aes(x=V1,y=V2)) + geom_point() + xlim(0,500) + ylim(0,100000)


##Bash/command line code
genomescope.R ecoli_HiSeqX.histo 21 150 hiseq_genomescope


################### 3.3 Contamination  #####################

##Bash/command line code

mash screen refseq.genomes.k21s1000.msh SRR18106304.fastq > screen.tab
sort -gr screen.tab | head


date
time 





 


