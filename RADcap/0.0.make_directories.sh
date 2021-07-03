#!/bin/bash
#BSUB -J mkdir
#BSUB -q q_residual
#BSUB -oo salida
#BSUB -eo error
#BSUB -n 4
#BSUB -R "span[hosts=1]"


#CREA TUS DIRECTORIOS DE TRABAJO DENTRO DE 'top'


mkdir -p ../cleaned 
mkdir -p ../Declone
mkdir -p ../fastqc
mkdir -p ../info 
mkdir -p ../raw 
mkdir -p ../refs 
mkdir -p ../Reportes
mkdir -p ../sondas_originales 
mkdir -p ../logos
mkdir -p ../processed
mkdir -p ../BWAaligned
