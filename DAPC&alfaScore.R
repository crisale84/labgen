pkges<- c("devtools", "ade4", "adegenet","cowplot", "ape", "dplyr", "ggplot2", "genetics","hierfstat",
          "igraph", "knitr", "lattice", "magrittr", "MASS", "mmod", "pegas", "pinfsc50", "poppr", 
          "readr", "radiator", "utils", "vcfR","viridisLite",
          "vegan", "permute", "RColorBrewer", "reshape2", "treemap" )
for (pkg1 in pkges){library(pkg1, character.only = TRUE)}
getwd()
setwd("~/Downloads/script_dapc/")
VCF <- read.vcfR("plink_166indv_YFT_missgeno35.vcf") 
VCF
Mydata2 <- vcfR2genlight(VCF)
Mydata2


####  Indexar poblaciones
popmap4strata <- read_tsv("popmapsort6_yft.tsv", col_names = TRUE)
popmap4strata
population<- popmap4strata$population  #this is @pop of each individual

pop(Mydata2) <- population
Mydata2@pop
Mydata2

#¿Cuántas poblaciones hay en tu set de datos?
Mydata2@pop
#¿cuántos individuos representan a cada población?
summary(Mydata2@pop) 

# la función:dapc(), hace el análisis de componentes principales con sus opciones por default y 
# te genera un gráfico que te permite observar el número de PCA que necesitas retener 
# para lograr retener el porcentaje de varianza deseada, ideal => 80%
dapc_Mydata2<-dapc(Mydata2)

# Necesitamos retener un 80% de varianza como mínimo, por lo tanto, seleccionaremos: 

## choose the number PC's to retain = 100 
#Choose the number discriminant functions to retain: 3 (Se elije la cantidad de barras que varían mucho entre sí, 
# cuando observes estabilidad en el tamaño de la barra  ya no las tomas en cuenta, en este caso puede ser 3), entre menos ELIJAS, MEJOR

dapc_Mydata2 # Este objeto guarda los resultados de # Discriminant Analysis of Principal Components #
dapc_Mydata2$var #Aquí se guarda la varianza retenida # 80.57 %
                 #logramos nuestro objetivo de retener por lo menos el 80%?? se puede mejorar??
dapc_Mydata2$n.da
scatter(dapc_Mydata2) # esta función dibuja el DAPC

# optim.a.score(), hace un análisis que te revela cuál es el número de PCs que debes elegir
# Córrelo mínimo 3 veces porque siempre salen números diferentes,sé objetivo 
num_pca <- optim.a.score(dapc_Mydata2) #Elegiré el número optimo de 90 PCs
num_pca
num_pca$best # guartda el mejor número de PCs, y se escribe en n.pca, 92
dapc_Mydata2$n.da  #guarda el número de discriminantes retenidas

#Aplicamos, todo lo aprendido:
#
dapc_optimo<-dapc(Mydata2,
                          n.da= dapc_Mydata2$n.da,    # se obtiene de: dapc_Mydata2$n.da
                          n.pca=num_pca$best)  #se obtiene de: num_pca$best, 100 en este caso
dapc_optimo$var # 80.57%
scatter(dapc_optimo)


# Editar las imágenes -----------------------------------------------------
myCol <- c("#0d0d15", #1
           "#ee2ceb",       #2
           "purple",        #3
           "green",         #4
           "deepskyblue",   #5
           "black",         #6
           "blue",          #7
           "red",           #8
           "gold",        #9 
           "#57f7f7"
)

scatter(dapc_optimo,
        bg="white", #FONDO
        pch = 17:25,
        col = myCol,  
        cex = 0.3,
        clabel = FALSE, 
        legend=TRUE, posi.leg="topright", #bottomleft, bottomright, topleft, topright
        cleg = 0.75,
        cellipse = 1.5, #dibuja una elipse a lo largo de los eigenvectors
        cstar = 0,  #lineas del centro de la elipse
        axesell = FALSE,
        scree.da=TRUE,
        posi.da = "bottomright",
        scree.pca=FALSE
        #posi.pca = "bottomright",
        #ratio.da=0.1,
        #ratio.pca=.1
)


title("DAPC de atunes", font.main=4, col.main="black") 

