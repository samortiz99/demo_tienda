library(shiny)
library(shinydashboard)
library(tidyverse)
library(reactable)
library(htmltools)

#conexiones 

usuarios <- data.frame("Nombre_completo" = as.character(),
                        "Cedula" = as.integer(),
                        "Correo" = as.character(),
                        "Direccion" = as.character(),
                        "Numero_de_celular" = as.integer(),
                        "x1" = as.character(),
                        "x2" = as.character(),
                        "x3" = as.character()) 
usuarios %>% 
  as.character("Nombre_completo")

#funciones
source("funtions.R")

#tablas conexiones


#tema


#desconexiones


