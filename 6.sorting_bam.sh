#!/bin/bash
#BSUB -J 6sort.atun
#BSUB -q q_residual
#BSUB -oo salida.6
#BSUB -eo error.6
#BSUB -n  6
#BSUB -R "span[hosts=1]"

module load samtools/1.0-gcc-4.4.6-s-serial
module load stacks/2.2


#PASO 5.- NOW, we need to sort BAM files
mkdir -p ../BWAaligned/bam_sort
for sample in $(cut -f1 popmap.tsv)
do
samtools sort -O bam -T ../BWAaligned/${sample} -o ../BWAaligned/bam_sort/${sample}.bam ../BWAaligned/alignedbam/${sample}.bam &> ../logos/bam_sort.log
done
