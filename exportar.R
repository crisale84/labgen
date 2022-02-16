###
## EXPORTAR el gráfico a formato .tiff 
###

# Abrir un dispositivo gráfico --------------------------------------------
tiff(filename = "DAPC_atunes.tiff",
     width = 1600, height = 880, units = "px", pointsize = 40,
     #compression = c("none", "rle", "lzw", "jpeg", "zip", "lzw+p", "zip+p"),
     bg = "white")

# Aquí va su gráfico ------------------------------------------------------

# Editar las imágenes -----------------------------------------------------
#browseURL("https://htmlcolorcodes.com/es/") #esta línea te da los codigos de más colores
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



# Cerrar tu dispositivo gráfico  ------------------------------------------
dev.off()

