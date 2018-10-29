#!/bin/bash
#$ -P control
#$ -j y
#$ -V
#$ -cwd
#$ -N tutoRNA
#$ -S /bin/bash

export TMPDIR=$HOME/scratch/tmp
export LOGDIR=$HOME/lox/${JOB_ID}
export WRKDIR=$HOME/work/tutorial/wHRNASeq
export MYSTATIC=/fast/users/szyskam_c/static

mkdir -p $LOGDIR
set -x
# !!! leading white space is important
DRMAA=" -pe smp 4 -l h_rt=03:00:00 -l h_vmem=2g"
DRMAA="$DRMAA -V -P medium -o ${LOGDIR} -j yes"
snakemake -p -r -k --drmaa "$DRMAA" -j 64

# name jobs in DRMAA using the wildcards?
