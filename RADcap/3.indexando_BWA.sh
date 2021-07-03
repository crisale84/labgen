#!/bin/bash
#BSUB -J 3DoraBWA
#BSUB -q q_residual
#BSUB -oo salida3
#BSUB -eo error3
#BSUB -n 4
#BSUB -R "span[hosts=1]"

module load samtools/1.0-gcc-4.4.6-s-serial 
module load stacks/2.2


#PASO1. CREAR TU GENOMA DE REFERENCIA E INDEXARLO, genoma de referencia: atun
REF=../refs/genoma_tbcompleto.fasta

#build an index or database with bwa
bwa index $REF &> ../logos/bwa.index.log

