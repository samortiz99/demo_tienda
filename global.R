library(shiny)
library(shinydashboard)
library(tidyverse)
library(reactable)
library(htmltools)
library(janitor)
library(readxl)
library(openxlsx)
library(shinyalert)
library(shinyjs)
library(fresh)


#conexiones 
departamentos <- "Departamentos_y_municipios_de_Colombia.csv"
bd_demo <- "relacionales.xlsx"
 
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

user_check <- read_xlsx(bd_demo, sheet = "usuarios_registrados")

shop_productos <- read_xlsx(bd_demo, sheet = "productos_id")


#creación del tema
mytheme <- create_theme(
  adminlte_color(
    light_blue = "#003d61" #header
  ),
  adminlte_sidebar(
    dark_bg = "#006fa2", #Background color (dark mode).
    dark_hover_bg = "#81A1C1", #menu item selected
    dark_color = "white", #Text color (dark mode).
    dark_hover_color	= "white", #Text hover color (dark mode).
    # dark_submenu_bg	= " ", #Background sub-menu color (dark mode). there 's no submenu in this shinyapp
    # dark_submenu_color	= " ", #Text sub-menu color (dark mode). there 's no submenu in this shinyapp
    # dark_submenu_hover_color	= " ", #Text sub-menu hover color (dark mode). there 's no submenu in this shinyapp
    #light_bg	= "#9C20CD", #Background color (light mode). ???
    #light_hover_bg	= "#9C20CD", #Background hover color (light mode). ???
    #light_color	= "#9C20CD", #Text color (light mode). ???
    #light_hover_color	= "#9C20CD", #Text hover color (light mode). ???
    # light_submenu_bg	= " ", #Background sub-menu color (light mode). there 's no submenu in this shinyapp
    # light_submenu_color	= " ", #Text sub-menu color (light mode). there 's no submenu in this shinyapp
    # light_submenu_hover_color	= " ", #Text sub-menu hover color (light mode). there 's no submenu in this shinyapp
  ),
  adminlte_global(
    content_bg = "#FFF", #body environment 
    box_bg = "#9C20CD", #Not found
    info_box_bg = "#9C20CD" #Not found
  )
)

#desconexiones


