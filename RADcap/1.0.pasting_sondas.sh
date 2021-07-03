#!/bin/bash
#BSUB -J 1SpPaste
#BSUB -q q_residual
#BSUB -oo salida.1
#BSUB -eo error.1
#BSUB -n 4
#BSUB -R "span[hosts=1]"

#para separar las sondas en R1 y R2
awk 'NR%4==1{print ">" substr($0,2)}NR%4==2{print}' ../refs/sondas_reference.fasta > ../refs/sondas.1.fasta
awk 'NR%4==3{print ">" substr($0,2)}NR%4==0{print}' ../refs/sondas_reference.fasta > ../refs/sondas.2.fasta


#en modulos de 4 imprime la primera y segunda linea
#y en modulos de 4 imprime la tercera y cuarta linea
#salta al siguiente modulo 
#pasting HB_2012.fq.gz

paste -d NNNNNNNNNNNNNNNNNNNN  ../refs/sondas.1.fasta ../refs/sondas.2.fasta > ../refs/sondas_pasted.fasta

cat ../refs/sondas_pasted.fasta| sed  's/N>T_albacares_locus[0-9][0-9][0-9][0-9][0-9]/ /g'| sed  's/N>T_albacares_locus[0-9][0-9][0-9][0-9]/ /g'\
 |sed  's/N>T_albacares_locus[0-9][0-9][0-9]/ /g'|sed  's/N>T_albacares_locus[0-9][0-9]/ /g' |sed  's/N>T_albacares_locus[0-9]/ /g'> ../refs/sondas_refs.fasta

