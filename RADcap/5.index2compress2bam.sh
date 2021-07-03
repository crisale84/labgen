#!/bin/bash
#BSUB -J 5IndBamDor
#BSUB -q q_residual
#BSUB -oo salida.5
#BSUB -eo error.5
#BSUB -n  6
#BSUB -R "span[hosts=1]"

module load samtools/1.0-gcc-4.4.6-s-serial
module load stacks/2.2

#paso3.- Comprimir nuestro archivo de alineamiento SAM con SAMTOOLS, Samtools generate its own index of the reference genome "-b" output BAM; -T reference file; -o output filenam$

mkdir -p ../BWAaligned/alignedbam
mkdir -p ../BWAaligned/refs_sam
cp ../refs/sondas.fa ../BWAaligned/refs_sam/
REF_SAM= ../BWAaligned/refs_sam/sondas.fa

samtools faidx $REF_SAM

#paso4.-NEXT WE NEED TO CONVERT THE SAM FILE INTO A BAM FILE

for sample in $(cut -f1 popmap.tsv);
do
samtools import $REF_SAM.fai ../BWAaligned/${sample}.sam  ../BWAaligned/alignedbam/${sample}.bam &> ../logos/samtools_import.log
done



