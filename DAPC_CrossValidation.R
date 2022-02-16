pkges<- c("devtools", "ade4", "adegenet", "ape", "cowplot", "dplyr", "ggplot2", "genetics","hierfstat",
          "igraph", "knitr", "lattice", "magrittr", "MASS", "mmod", "pegas", "pinfsc50", "poppr", 
          "readr", "radiator", "utils", "vcfR","viridisLite",
          "vegan", "permute", "RColorBrewer", "reshape2", "treemap" )
for (pkg1 in pkges){library(pkg1, character.only = TRUE)}
###NOTA: ESTE SCRIPT CORRE CON UN OBJETO GENIND: en este caso iPinf
cross validation para  DAPC

set.seed(999)
pramx <- xvalDapc(tab(Mydata2, NA.method = "mean"), pop(Mydata2))
#pramx arroja los siguientes resultados
names(pramx)

pramx[7]
#################################################
# Discriminant Analysis of Principal Components #
#################################################
class: dapc
$call: dapc.data.frame(x = as.data.frame(x), grp = ..1, n.pca = ..2, 
                       n.da = ..3)

$n.pca: 50 first PCs of PCA used
$n.da: 9 discriminant functions saved
$var (proportion of conserved variance): 0.531


myCol <- c("antiquewhite4","magenta","purple","green","deepskyblue","black","blue","red","gold",
           "darksalmon","brown4","darkcyan","lightpink","olivedrab1","sienna1","thistle3","thistle1",
           "slategray1","pink1","seagreen1","paleturquoise1","palevioletred1","peachpuff1","plum1",
           "seashell1","salmon1")


scatter(pramx$DAPC,  
        col = myCol,  
        cex = 1.2,
        legend =TRUE,
        clabel = FALSE, 
        posi.leg = "topright", #"bottomleft","bottomright","topleft","topright"
        scree.pca=FALSE, 
        posi.pca = "topleft",
        cleg = 0.75, xax = 1, yax = 2, inset.solid = 1)

