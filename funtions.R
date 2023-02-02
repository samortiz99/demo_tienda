#Limpieza celular y cedula
limpiar_num <- function(x) {
  x = as.character(x) #convertir en char
  x = gsub(" ", "",x) #remover espacios en blanco
  x = gsub("[[:punct:]]", "", x) #Eliminar puntuación
  x = gsub("[^a-zA-Z0-9]","",x)#Elimnar no alfanumericos
  x = gsub("^ ", "", x) #Eliminar espacios en blanco al inicio
  x = gsub(" $", "", x) #Eliminar espacios en blanco al final
  x = as.numeric(x) #convertir a numerico 
  return(x)
}
 
x = "4235435e"
