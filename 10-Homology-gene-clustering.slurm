#!/bin/bash
#SBATCH --job-name=update-db
#SBATCH --output=T.txt
#SBATCH --partition=dribe
#SBATCH --ntasks=72
#SBATCH --time=72:00:00

module load blast+/2.11.0
 

update_blastdb.pl --showall > databases.txt


date
time 





 


