server <- function(input, output, session){
  
  
  observeEvent(input$pais, {
    
    if(input$pais == "Colombia") {
      updateSelectInput(session, "departamentos", 
                        choices = c("Amazonas" = "Amazonas",
                                    "Antioquia" = "Antioquia",
                                    "Arauca" = "Arauca",
                                    "Atlántico" = "Atlántico",
                                    "Bolívar" = "Bolívar",
                                    "Boyacá" = "Boyacá",
                                    "Caldas" = "Caldas",
                                    "Caquetá" = "Caquetá",
                                    "Casanare" = "Casanare",
                                    "Cauca" = "Cauca",
                                    "Cesar" = "Cesar",
                                    "Chocó" = "Chocó",
                                    "Córdoba" = "Córdoba",
                                    "Cundinamarca" = "Cundinamarca",
                                    "Guainía" = "Guainía",
                                    "Guaviare" = "Guaviare",
                                    "Huila" = "Huila",
                                    "La Guajira" = "La Guajira",
                                    "Magdalena" = "Magdalena",
                                    "Meta" = "Meta",
                                    "Nariño" = "Nariño",
                                    "Norte de Santander" = "Norte de Santander",
                                    "Putumayo" = "Putumayo",
                                    "Quindío" = "Quindío",
                                    "Risaralda" = "Risaralda",
                                    "San Andrés y Providencia" = "San Andrés y Providencia",
                                    "Santander" = "Santander",
                                    "Sucre" = "Sucre",
                                    "Tolima" = "Tolima",
                                    "Valle del Cauca" = "Valle del Cauca",
                                    "Vaupés" = "Vaupés",
                                    "Vichada" = "Vichada"))
    }
  })
  
  
  agregar_usuario <- eventReactive(input$save,{
    
    nuevacc <- limpiar_num(input$id)
    
    general_info <- data.frame(
      Nombre_completo = input$fullname,
      Cedula = nuevacc,
      Correo = input$hotmail,
      Direccion = input$direction,
      Numero_de_celular = input$cel,
      x1 = "na",
      x2 = "na",
      x3 = "na"
    )
    
    usuarios <- union(usuarios, general_info)
    #the tittles need to be the same observation, check it
    #No sirve la función 
    
    
  })
  
  output$table <- renderReactable({
    
      reactable(agregar_usuario(),
                defaultColDef = colDef(
                  align = "center"
                ))
    }
  )
}