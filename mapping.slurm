#!/bin/bash
#SBATCH --job-name=mapping
#SBATCH --mem=32000
#SBATCH -c 16

#JOB LOG HEADER
perl -E 'say"="x80'; echo "JOB STARTED: `date`"; echo "NODE: `hostname`"; echo "SCRIPT ${0}:"; cat $0; perl -E 'say"="x80'

cd ~/project1_mikail

#SOFTWARE REQUIREMENTS
export PATH=$PATH:/usr/local/hisat2

#VARIABLES
INFILE=~/project1_mikail/heart_6a.s_trimmed.fq.gz    			#INPUT FILE
INDEX=/work/binf-courses/binf694/project_1/reference/human-hisat2/grch38/genome	#GENOME INDEX FILE
PREFIX=`basename -s ".fq.gz" ${INFILE}`                             		#COMMAND IDENTIFIES THE FILE PREFIX
OUTFILE=~/project1_mikail/${PREFIX}.bam                        		#OUTPUT FILE

# COMMAND(s) TO RUN
hisat2 -p ${SLURM_CPUS_PER_TASK} -x ${INDEX} -U ${INFILE} \
| samtools view -Sbo ${OUTFILE} -


#JOB LOG FOOTER
perl -E 'say"="x80'; echo "JOB COMPLETED: `date`"; perl -E 'say"="x80'
