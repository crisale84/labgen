#!/bin/bash

#BSUB -J Dora2proCs
#BSUB -o salida2
#BSUB -eo error2
#BSUB -n 8
#BSUB -q q_residual
#BSUB -R "span[hosts=1]"

module load stacks/2.2

#ClaI, BamHI,  MspI

mkdir -p ../cleaned
for sample in $(cut -f1 popmap.tsv)
do
process_radtags -1 ../Declone/${sample}.1.1.fq -2 ../Declone/${sample}.2.2.fq  -o ../cleaned -c -q -r -t 140 --inline_inline --renz_1 mspI --renz_2 claI  -i gzfastq -y gzfastq &> ../logos/process.log
done

