server <- function(input, output, session){
  
  
  #reactives are defined to make selectInput function interactive whit the others
  #makes the next observeEvent "automatic"
  departamento <- reactive({
    pais_selected <- input$pais
    operacion_pais <- deps |>
      filter(pais == pais_selected) |>
      distinct(departamento) #distinct is kind of groupby, it takes one of all same elements
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
  
  
  #eventReactive start working at the moment the input is selected by the user
  agregar_usuario <- eventReactive(input$save,{
    
    #this variable represents the fullname of the user
    ui_fullname <- input$fullname |> as.character()
    #this variable represents the user id
    ui_id <- input$id |>  as.character()
    #this variable represents the user's hotmail
    ui_hotmail <- input$hotmail |>  as.character()
    #this variable represents the user's adress
    ui_adress <- input$adress |>  as.character()
    #this variable represents the user's cellphone
    ui_cel <- input$cel |>  as.character()
    #this variable represents the country of the user
    ui_pais <- input$pais |>  as.character()
    #this variable represents the department of the user
    ui_departamentos <- input$departamentos |>  as.character()
    #this variable represents the city of the user
    ui_cities <- input$municipios |>  as.character()
    
  
    general_info <- tibble(
      nombre_completo = ui_fullname,
      cedula = ui_id,
      correo = ui_hotmail,
      direccion = ui_adress,
      numero_de_celular = ui_cel,
      pais = ui_pais,
      departamentos = ui_departamentos,
      municipios = ui_cities
    )
    
    colnames(general_info) <- colnames(general_info) |> 
      str_replace_all("_", " ")
    
    return(general_info)

  })
  
  
  #observeEvent to save the user's information...
  
  
  
  output$table <- renderReactable({
    
      reactable(agregar_usuario(),
                defaultColDef = colDef(
                  align = "center"))
    })
}