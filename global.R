library(shiny)
library(shinydashboard)
library(tidyverse)
library(reactable)
library(htmltools)
library(janitor)

#conexiones 
departamentos <- "Departamentos_y_municipios_de_Colombia.csv"

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

deps <- read_csv(departamentos)
deps <- deps |> 
  select(3,5) |>
  mutate(PAIS = "Colombia") |> 
  clean_names()

#tema


#desconexiones


