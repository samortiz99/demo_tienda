server <- function(input, output, session){
  
  #shiny::observe({
    #if (#agregar función) {
    #  #aquí falta agregar el shinyjs::hide()
    #}
  #})
  
  
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
    
    #this variable represents the fullname entered by the user
    ui_fullname <- input$fullname |> as.character()
    #this variable represents the id entered by user
    ui_id <- input$id |>  as.character()
    #this variable represents the hotmail entered by user
    ui_hotmail <- input$hotmail |>  as.character()
    #this variable represents the adress entered by user
    ui_adress <- input$adress |>  as.character()
    #this variable represents the cellphone entered by user
    ui_cel <- input$cel |>  as.character()
    #this variable represents the country entered by user
    ui_pais <- input$pais |>  as.character()
    #this variable represents the department entered by user
    ui_departamentos <- input$departamentos |>  as.character()
    #this variable represents the city entered by user
    ui_cities <- input$municipios |>  as.character()
    
  
    general_info <- tibble(
      nombre_completo = ui_fullname,
      cedula = ui_id,
      correo = ui_hotmail,
      direccion = ui_adress,
      numero_de_celular = ui_cel,
      pais = ui_pais,
      departamentos = ui_departamentos,
      municipios = ui_cities)
    
    colnames(general_info) <- colnames(general_info) |> 
      str_replace_all("_", " ")
    
    return(general_info)
  })
#Función para retornar un texto después de identificar el usuario  id=1234
#  validation_process <- eventReactive(input$validation_button,{
#    user_validation <- input$cc_validation_registro
#    if (user_validation %in% user_check$user_id) {
#      return("Su ID se encuentra registrado, bienvenido")
#    } else {
#      return("Lo siento, su ID no se encuentra registrado, por favor haga el registro para ingresar a la tienda")
#    }
#  })
  
  observeEvent(input$validation_button, {
    user_validation <- input$cc_validation_registro
    if (user_validation %in% user_check$user_id) {
      shinyalert(
        title = "",
        text = "Su usuario se encuentra registrado, puede acceder a la tienda",
        size = "xs", 
        closeOnEsc = TRUE,
        closeOnClickOutside = TRUE,
        html = FALSE,
        type = "success",
        showConfirmButton = TRUE,
        showCancelButton = FALSE,
        confirmButtonText = "OK",
        confirmButtonCol = "#AEDEF4",
        timer = 0,
        imageUrl = "",
        animation = TRUE)
    } else {
      shinyalert(
        title = "",
        text = "No se encuentra registrado, por favor llene el formulario de registro",
        size = "xs", 
        closeOnEsc = TRUE,
        closeOnClickOutside = TRUE,
        html = FALSE,
        type = "warning",
        showConfirmButton = TRUE,
        showCancelButton = FALSE,
        confirmButtonText = "OK",
        confirmButtonCol = "#AEDEF4",
        timer = 0,
        imageUrl = "",
        animation = TRUE
      )
    }
  })
  
  output$table <- renderReactable({
    reactable(agregar_usuario(),
                defaultColDef = colDef(
                  align = "center"))
    })
  
  
  
  #Para asignar valores al selectinput de la tienda:
  choices_categ_productos <- reactive({
    shop_cat_producto <- read_xlsx(bd_demo, sheet = "categorias_id")
    c(" ", shop_cat_producto$categoría)
  })
  
  observe({
    updateSelectInput(session, 
                      inputId = "categoria_productos",
                      choices = choices_categ_productos())
  })
  
  
  
  
#  output$user_validation <- renderText({             #id = 1234
#    validation_process()
#  })
}