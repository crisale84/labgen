#!/bin/bash
#BSUB -J Dora.1Clon
#BSUB -q q_residual
#BSUB -oo salida
#BSUB -eo error
#BSUB -n 4
#BSUB -R "span[hosts=1]"

module load  stacks/2.2   


############AQUI EMPIEZA EL SCRIPT RADCAP#########

mkdir -p ../Declone
mkdir -p ../logos

cp ../info/popmap.tsv .
for sample in $(cut -f1 popmap.tsv)
do
clone_filter -1 ../raw/${sample}.1.fq.gz -2 ../raw/${sample}.2.fq.gz  -i gzfastq -o ../Declone -y gzfastq --index_null --oligo_len_2 8 &> ../logos/clonefilter1.log
done

