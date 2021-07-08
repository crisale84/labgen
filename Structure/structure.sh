#!/bin/bash
#BSUB -J strkClase
#BSUB -q q_residual
#BSUB -oo salida.p1
#BSUB -eo error.p1
#BSUB -n 6
#BSUB -R "span[hosts=1]"

#CAMBIA NUMPOPS POR TU NUMERO MAXIMO DE poblaciones+uno= K
NUMPOPS=4

#CAMBIA AL  NÚMERO DE REPLICAS POR CADA K QUE QUIERAS EJECUTAR
NUMREPS=3

for ((POP=1; POP<=$NUMPOPS; POP++)) 
do
	#NO MOVER!CAMBIA EL NUMERO DE K QUE SE ESTA PROBANDO EN MAINPARAMS CADA CICLO
	perl -pi -e 's/MAXPOPS	[0-9]+/MAXPOPS	'$POP'	/g' mainparams                        

	for ((REP=1; REP<=$NUMREPS; REP++))
	do
	
	#NO MOVER! CAMBIA EL NOMBRE DEL OUTPUT EN MAINPARAMS CADA CICLO
	perl -pi -e 's/populations.structure.modified.out.tsv.K[0-9]+_rep[0-9]+/populations.structure.modified.out.tsv.K'$POP'_rep'$REP'/g' mainparams
	
	#NO MOVER! ejecuta structure 
	./structure -m mainparams -e extraparams -i populations.structure.modified.tsv   -o populations.structure.modified.out.tsv.K${POP}_rep${REP} -K $POP &> structure.log
	done
	
done


now=$(date +"%m_%d_%Y")
mkdir results$now
mv *_f results$now
zip -r results$now.zip results$now


# upload the results.zip file to the web page:  http://taylor0.biology.ucla.edu/structureHarvester/
# example of an aplication to obtain a structure plot http://omicsspeaks.com/strplot2/
