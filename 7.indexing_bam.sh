#!/bin/bash
#BSUB -J 7IndBamDor
#BSUB -q q_residual
#BSUB -oo salida7
#BSUB -eo error7
#BSUB -n  6
#BSUB -R "span[hosts=1]"

module load samtools/1.0-gcc-4.4.6-s-serial
module load stacks/2.2

mkdir -p ../BWAaligned/bam_sort

#PASO 6.-INDEX-BAM
for sample in $(cut -f1 popmap.tsv)
do
samtools index ../BWAaligned/bam_sort/${sample}.bam
done

