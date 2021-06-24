#!/bin/bash
#BSUB -J 9.PopDora2
#BSUB -q q_residual
#BSUB -oo salida9
#BSUB -eo error9
#BSUB -n  6
#BSUB -R "span[hosts=1]"

module load stacks/2.2

#PASO 9. Run populations. Calculate Hardy-Weinberg deviation, population statistics, f-statistics and smooth the statistics across the genome. Export several output files.

mkdir -p ../gstacks_output/populations2_NOFILTERS
populations -P ../gstacks_output/ -O ../gstacks_output/populations2_NOFILTERS -M popmap.tsv -r 0.80 --vcf --plink --genepop \
--fasta --fstats -k --sigma 100000 --structure --hwe

MAXP=26
for ((p=1; p<=$MAXP; p++))
do
mkdir -p ../gstacks_output/populations2_r0.8_p$p
populations -P ../gstacks_output/ -O ../gstacks_output/populations2_r0.8_p$p  -r 0.8 \
-p $p --min_maf 0.05 --max_obs_het 0.70 -M popmap.tsv --write_single_snp \
 --genepop --fasta --fstats -k --sigma 100000 --smooth_popstats --smooth_fstats --bootstrap_fst  --hwe --vcf --structure &> ../logos/populations2.n94_r0.8_p$p.log
done


