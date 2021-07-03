#!/bin/bash
#BSUB -J 9.1lewini
#BSUB -q q_16p_256g
#BSUB -oo salida9
#BSUB -eo error9
#BSUB -n  16
#BSUB -R "span[hosts=1]"

module load stacks/2.2

#PASO 9. Run populations. Calculate Hardy-Weinberg deviation, population statistics, f-statistics and smooth the statistics across the genome. Export several output files.


#CAMBIA NUMPOPS POR TU NUMERO MAXIMO DE poblaciones+uno= K
NUMPOPS=10

#CAMBIA AL  NÚMERO DE REPLICAS POR CADA K QUE QUIERAS EJECUTAR


for ((POP=1; POP<=$NUMPOPS; POP++)) 
do

rlist=(0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1)
for i in ${rlist[@]}
 do

	mkdir -p ../populations.p${POP}_r${i}
	
        populations -P ../gstacks_output -O ../populations.p${POP}_r${i} -r ${i} \
        -p $POP --min_maf 0.01 --max_obs_het 0.70 \
        -M ../refs/popmap.tsv --write_random_snp --vcf --structure --genepop \
 	--fasta --fstats -k --sigma 100000 --smooth_popstats --smooth_fstats --bootstrap_fst  --hwe  &> ../logos/populations.p${POP}_r${i}.log
        
        done
done
