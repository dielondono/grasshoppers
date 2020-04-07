#!/bin/bash

#SBATCH --job-name="target.sh"

#SBATCH --partition=serial_mpp2

#SBATCH --clusters=serial

#SBATCH -t 72:00:00

#SBATCH -n 20

#SBATCH --mail-user=dielondono@gmail.com

#SBATCH --mail-type=ALL



STARTTIME=$(date +%s)



echo " ###### Job name: $SLURM_JOB_NAME, job ID: $SLURM_JOB_ID ######"

echo " Job started at $(date)."



module load bioinfo-tools

module load paleomix/1.2.9

module load java/1.8

module load mapDamage/2.0.8

module load samtools/1.3.1

module load rsem/1.3.0

module load bwa/0.7.15

module load blast+/2.6.0

module load r

module load adapterremoval/2.1.7

module load python


# This is the path to the makefile, change it depending on the makefile you want to run
bam_pipeline run --max-threads 1 --temp-root /dss/dsshome1/lxc07/ru87mis2/diego/tmp /dss/dsshome1/lxc07/ru87mis2/diego/makefile3.yaml



ENDTIME=$(date +%s)

TIMESPEND=$(($ENDTIME - $STARTTIME))

((sec=TIMESPEND%60, TIMESPEND/=60, min=TIMESPEND%60, hrs=TIMESPEND/60))

timestamp=$(printf "%d:%02d:%02d" $hrs $min $sec)

echo "Job ended at $(date). Took $timestamp hours:minutes:seconds to complete."




