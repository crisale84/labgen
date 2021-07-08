#!/bin/bash
#paso1
tail -n+2  /tmpu/pindaro_g/cdm_a/cris/2bRADs/stacks.denovo/populations_NOFILTERS/populations.structure  > populations.structure.tsv

#
#2.- how many loci?
#

echo  "¿how many loci?"
head -n 1 populations.structure.tsv | tr "\t" "\n" | grep -v "^$" | wc -l


# CHANGING pops2numb

cat populations.structure.tsv | sed -E \
-e 's/	Mexico	/	1	/ ' \
-e 's/	Brasil	/	2	/ ' \
-e 's/	Argentina	/	3	/ '  > populations.structure.modified.tsv

