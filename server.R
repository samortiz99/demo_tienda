server <- function(input, output, session){
  
  
  #reactives are defined to make selectInput function interactive whit the others
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
  
  
  #observeEvent is used to update the next selectInput function in ui.R 
  observeEvent(input$pais, {
    updateSelectInput(session,
                      "departamentos", 
                      choices = departamento())
  })
  
  observeEvent(input$departamentos, {
    updateSelectInput(session, 
                      "municipios",
                      choices = municipio())
    
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
    
    write.csv(general_info,file = "asas.csv",append = F)
    return(general_info)
  })
  
  output$table <- renderReactable({
    
      reactable(agregar_usuario(),
                defaultColDef = colDef(
                  align = "center"
                ))
    }
  )
}