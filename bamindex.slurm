#!/bin/bash
#SBATCH --job-name=bamindex
#SBATCH --mem=64000
#SBATCH -c 16

#JOB LOG HEADER
perl -E 'say"="x80'; echo "JOB STARTED: `date`"; echo "NODE: `hostname`"; echo "SCRIPT ${0}:"; cat $0; perl -E 'say"="x80'

cd ~/project1_mikail

#SOFTWARE REQUIREMENTS

#VARIABLES
INFILE=~/project1_mikail/brain_3c.s_trimmed.bam
PREFIX=`basename -s ".bam" ${INFILE}`

# COMMAND(s) TO RUN
samtools sort -@ 16 -m 3750M -o ${PREFIX}.sorted.bam ${INFILE}
samtools index ${PREFIX}.sorted.bam

#JOB LOG FOOTER
perl -E 'say"="x80'; echo "JOB COMPLETED: `date`"; perl -E 'say"="x80'
