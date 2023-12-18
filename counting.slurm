#!/bin/bash
#SBATCH --job-name=counting
#SBATCH --mem=32000
#SBATCH -c 1

#JOB LOG HEADER
perl -E 'say"="x80'; echo "JOB STARTED: `date`"; echo "NODE: `hostname`"; echo "SCRIPT ${0}:"; cat $0; perl -E 'say"="x80'

cd ~/project1_mikail

#SOFTWARE REQUIREMENTS

#VARIABLES
INDIR=~/project1_mikail    		                                                   # INPUT DIRECTORY
GFF=/work/binf-courses/binf694/project_1/reference/human-hisat2/grch38/Homo_sapiens.GRCh38.84.gtf  # ANNOTATION GTF FILE FOR GENOME
OUTDIR=~/project1_mikail/ref_counting                  		                                   # OUTPUT DIRECTORY

#COMMAND(s) TO RUN
# THIS LOOP WILL RUN THE INDENTED PART ON EACH FILE ENDING IN .bam IN THE INPUT DIRECTORY
for i in `ls -1 ${INDIR}/*.sorted.bam`
do
   echo "PROCESSING FILE: ${i}"
   PREFIX=`basename -s ".bam" ${i}`
   #USE samtools TO PIPE THE CONTENTS OF THE FILE INTO htseq-count
   htseq-count --mode intersection-nonempty \
      --stranded no \
      --format bam \
      --type exon \
      --idattr gene_name \
      ${i} \
      ${GFF} \
      > ${OUTDIR}/${PREFIX}.count.txt
done


#JOB LOG FOOTER
perl -E 'say"="x80'; echo "JOB COMPLETED: `date`"; perl -E 'say"="x80'
