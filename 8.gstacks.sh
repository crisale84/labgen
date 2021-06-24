#!/bin/bash
#BSUB -J 8.gstacks
#BSUB -q q_residual
#BSUB -oo salida8
#BSUB -eo error8
#BSUB -n  6
#BSUB -R "span[hosts=1]"

module load stacks/2.2

#PASO 8.- Run gstacks to build loci from the aligned paired-end data.
mkdir -p ../gstacks_output
gstacks -I ../BWAaligned/bam_sort/ -M popmap.tsv -O ../gstacks_output/ -t 6 &> ../logos/gstacks.log

