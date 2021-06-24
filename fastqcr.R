#http://www.sthda.com/english/wiki/fastqcr-an-r-package-facilitating-quality-controls-of-sequencing-data-for-large-numbers-of-samples

devtools::install_github("kassambara/fastqcr")
library("fastqcr")
library(dplyr)
####### RUNNING fastqc

fastqc(fq.dir = "../7_limpieza_demultiplexadas/", # FASTQ files directory
       qc.dir = "../fastqcr_output", # Results direcory
       threads = 4                    # Number of threads
)

# Aggregating Multiple FastQC Reports into a Data Frame 
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
# Demo QC directory containing zipped FASTQC reports
qc.dir <- ("../fastqcr_output")
qc <- qc_aggregate(qc.dir)
qc


summary(qc)

#general statistics
stats.per.sample<-qc_stats(qc)

View(qc_stats(qc))

#################
dim(stats.per.sample)
n = 330           # n toma la dimension de rows
R2 = c()      # Se crea un vector vacío
R1 = c()    # Idem
 for(i in 1:n){   # Se van a procesar los números de 1 a n
  if(i%%2==0) R2<-c(R2,i)    # Si al dividir por 2 sale 0
  else R1<-c(R1,i)}     # el numero es par, impar en otro caso
 R2
 R1

stats.per.sample.r1<- stats.per.sample[R1 , ]  
stats.per.sample.r1
View(stats.per.sample.r1)
write.csv(stats.per.sample.r1, "../2clean.stats.per.sample.r1.csv", col.names = TRUE, row.names = TRUE)
 
 
 
 
 
 
 
 




