#!/bin/bash
#BSUB -J 4AliBWADor
#BSUB -q q_residual
#BSUB -oo salida4
#BSUB -eo error4
#BSUB -n  6
#BSUB -R "span[hosts=1]"

module load samtools/1.0-gcc-4.4.6-s-serial
module load stacks/2.2


#Align paired-end data with BWA, src= ../cleaned

REF=../refs/sondas.fa
mkdir ../BWAaligned

cp ../info/popmap.tsv .

for sample in $(cut -f1 popmap.tsv); 
do
bwa mem -t 4 -M ${REF} ../processed/${sample}.1.1.fq.gz ../processed/${sample}.2.2.fq.gz > ../BWAaligned/${sample}.sam
done

