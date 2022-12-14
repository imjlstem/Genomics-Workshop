#!/bin/bash
#SBATCH --job-name=Post-assembly-QC
#SBATCH --output=Post-assembly-QC.out 
#SBATCH --partition=dribe
#SBATCH --ntasks=72
#SBATCH --time=72:00:00

module load miniconda/3



################### 5.1 HiFiasm fasta generation  #####################

awk '/^S/{print ">"$2;print $3}' hifi_ecoli.p_ctg.gfa > hifi_ecoli.p_ctg.fa


#######################  5.2 K-mer content  ###########################

source activate kat

kat comp -t 16 -o SRR18106304_vs_spades SRR18106304.fastq ecoli_hiseq_spades/scaffolds.fasta

source deactivate

#######################  5.3 Gene content  ###########################

source activate busco 

busco -m genome -i /scratch/ecoli_hiseq_spades/scaffolds.fasta -o Hiseq_busco --auto-lineage-prok

source deactivate 

#######################  5.4 Quast Report  ###########################

module load quast/4.6.0
quast -r GCF_000005845.2_ASM584v2_genomic.fna –circos –gene-finding –output-dir test_quast ./Hifi_ecoli.fa ./ecoli-oxford/ecoli.contigs.fasta ./ecoli_hiseq_spades/scaffolds.fasta







date
time 





 


