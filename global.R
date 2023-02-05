library(shiny)
library(shinydashboard)
library(tidyverse)
library(reactable)
library(htmltools)
library(janitor)
library(readxl)
library(openxlsx)

#conexiones 
departamentos <- "Departamentos_y_municipios_de_Colombia.csv"

#funciones
source("funtions.R")

#tablas conexiones

deps <- read_csv(departamentos,
                 col_types = cols(.default = col_character()))
deps <- deps |> 
  select(3,5) |> 
  mutate(pais = "Colombia") |> 
  clean_names() #clean_names functions just can be applied in non-null tibbles -
                #and it return values " " as "_" and uppers as lower

#tema


#desconexiones


