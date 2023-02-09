server <- function(input, output, session){
  
  # shiny::observe({
  #   user_validation <- input$cc_validation_registro
  #   if (user_validation %notin% user_check$user_id) {
  #     shinyjs::hide(session, "shop")
  #   }
  # })
  
  #---Para redirigir el usuario a la pestaña shop en caso de estar registrado---#
  
  observeEvent(input$validation_button, {
    user_validation <- input$cc_validation_registro
    if (user_validation %in% user_check$user_id) {
      updateTabItems(session, "tabs", "shop")
    }
  })
  
  #---Para redirigir el usuario a la pestaña Registro en caso de estar registrado---#
  
  observeEvent(input$validation_button, {
    user_validation <- input$cc_validation_registro
    if (!user_validation %in% user_check$user_id) {
      updateTabItems(session, "tabs", "informacion_ingresada", "registro")
    }
   })
  
  #------------- Definición valores de los selectInput en registro ------------#
  
  departamento <- reactive({
    pais_selected <- input$pais
    operacion_pais <- deps |>
      filter(pais == pais_selected) |>
      distinct(departamento) 
    return(c("", operacion_pais))
  })
  
  municipio <- reactive({
    departamento_selected <- input$departamentos
    operacion_dep <- deps |> 
      filter(departamento == departamento_selected) |> 
      distinct(municipio)
    return(c("", operacion_dep))
  })
  
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
  
  #-------------- Alerta usuarios registrados - no registrados ---------------#

  observeEvent(input$validation_button, {
    user_validation <- input$cc_validation_registro
    if (user_validation %in% user_check$user_id) {
      shinyalert(
        title = "",
        text = "Su usuario se encuentra registrado, puede acceder a la tienda",
        size = "xs",
        closeOnClickOutside = TRUE,
        type = "success"
      )
    } else {
      shinyalert(
        title = "",
        text = "No se encuentra registrado, por favor llene el formulario de registro",
        size = "xs",
        closeOnClickOutside = TRUE,
        type = "warning"
      )
    }
  })
  
  #------------ Alerta ingresar formulario de registro completo---------------#
  
  observeEvent(input$save, {
    
    if (input$fullname == "" | input$id == "" | input$hotmail == "" | 
        input$adress  == "" | input$cel == "" | input$pais == "" | 
        input$departamentos == "" | input$municipios == "") {
      
      shinyalert(
        title = "",
        text = "Por favor rellenar todo el formulario",
        size = "xs", 
        closeOnClickOutside = TRUE,
        type = "warning"
      )
    } else {
      shinyalert(
        title = "",
        text = "Registrado exitosamente, bienvenido",
        size = "xs",
        closeOnClickOutside = TRUE,
        type = "success"
      )
    }
  })

  #-------------- Definición valores de los selectInput en shop --------------#
    
  choices_categ_productos <- reactive({
    c(" ", shop_cat_producto$categoría)  
  })
  
  choices_productos <- reactive ({
    cat_selected <- input$categoria_productos
    productos <- as_tibble(left_join(
      shop_productos, shop_cat_producto, by = "categoria_id"))
    productos1 <- productos |>  filter(cat_selected == productos$categoría) |> 
      distinct(producto) 
    return(productos1)
  })
  
  observe({
    updateSelectInput(session, 
                      inputId = "categoria_productos",
                      choices = choices_categ_productos())
  })
  
  observeEvent(input$categoria_productos, {
    updateSelectInput(session,
                      inputId = "productos",
                      choices = choices_productos())
  })
  
  #------------------------ Cálculo de valor a pagar -------------------------#
  
  payment_check <- reactive({
    cantidad_a_comprar <- input$cantidad_productos_solicitados |> as.numeric()
    producto_a_comprar <- input$productos
    valor_producto_unitario <- shop_productos |> 
      filter(producto_a_comprar == producto) |> 
      select(precio) |>  pull()
    if (producto_a_comprar == "") {
      final_text <- ""
    } else {
      operacion_compra <- cantidad_a_comprar * valor_producto_unitario
      final_text <- paste(c("Valor a pagar: $", operacion_compra))
    }
    return(final_text)
  })
  
  output$payment <- renderText({
    payment_check()
  })
}