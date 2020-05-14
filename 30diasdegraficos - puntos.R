# Gráfico de puntos
# 14/05/2020
# #30díasdegráficos con R, una iniciativa de la comunidad hispanohablante de R 
# para recordar a Florence Nightingale y aprender sobre visualización de datos.

# Paquetes utilizados 

library(tidyverse) # En este caso solo ggplot2
# -- Attaching packages --------------------------------------- tidyverse 1.3.0 --
# v ggplot2 3.3.0     v purrr   0.3.4
# v tibble  3.0.0     v dplyr   0.8.5
# v tidyr   1.0.2     v stringr 1.4.0
# v readr   1.3.1     v forcats 0.5.0
# -- Conflicts ------------------------------------------ tidyverse_conflicts() --
# x dplyr::filter() masks stats::filter()
# x dplyr::lag()    masks stats::lag()


library(readxl) # Para leer los datos que vengan de excel

library(ggrepel) # Con este paquete se le pueden poner los cartelitos al grafico
# Loading required package: ggplot2

# Datos 

puntuaciones <- read_xlsx("datos/dimensiones_anexo.xlsx", col_names = T)

puntuaciones$set <- as.character(puntuaciones$set)

# Graficos

grafico_general <- ggplot(data = puntuaciones, aes(x = MVG, y = MAG, colour = set)) +
  geom_point() +
  labs(title = "Dispersión de las puntuaciones de los 234 estímulos según su Valencia y Activación", 
       x = "Valencia", y = "Activación",
       subtitle = "Comparación entre los distintos conjuntos de estímulos") +
  geom_label_repel(aes(label = ifelse(MVG < 2 & MAG > 7.5, as.character(descripcion),'')),
                   box.padding   = 0.35, 
                   point.padding = 0.5) +
  geom_label_repel(aes(label = ifelse(MVG > 6 & MAG > 6, as.character(descripcion),'')),
                   box.padding   = 0.35, 
                   point.padding = 0.5) +
  geom_label_repel(aes(label = ifelse(MVG > 5 & MAG < 3.5, as.character(descripcion),'')),
                   box.padding   = 0.35, 
                   point.padding = 0.5) +
  coord_flip() +
  theme_minimal()


