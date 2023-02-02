server <- function(input, output, session){
  
  
  departamento <- reactive({
    pais_selected <- input$pais
    operacion_pais <- deps |>
      filter(pais == pais_selected) |>
      distinct(departamento)
    return(operacion_pais)
  })
  
  municipio <- reactive({
    departamento_selected <- input$departamentos
    operacion_dep <- deps |> 
      filter(departamento == departamento_selected) |> 
      distinct(municipio)
    return(operacion_dep)
  })
  
  
  
  observeEvent(input$pais, {
      
      updateSelectInput(session, 
                        "departamentos", 
                        choices = departamento())
    
    
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