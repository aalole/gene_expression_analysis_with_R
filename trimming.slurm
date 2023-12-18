#!/bin/bash
#SBATCH --job-name=trimming
#SBATCH --mem=12000
#SBATCH -c 1

#JOB LOG HEADER
perl -E 'say"="x80'; echo "JOB STARTED: `date`"; echo "NODE: `hostname`"; echo "SCRIPT ${0}:"; cat $0; perl -E 'say"="x80'

cd ~/project1_mikail

#SOFTWARE REQUIREMENTS

#VARIABLES
INFILE=/work/binf-courses/binf694/project_1/raw_data/heart/heart_6a.s.fastq.gz

# COMMAND(s) TO RUN
trim_galore --length 50 --quality 28 ${INFILE}


#JOB LOG FOOTER
perl -E 'say"="x80'; echo "JOB COMPLETED: `date`"; perl -E 'say"="x80'
