ui <- dashboardPage(
  
  head <- dashboardHeader(title = "FORMULARIO"),
  
  sidebar <- dashboardSidebar(
    sidebarMenu(id = "tabs",          #this argument will be used in <conditionalPanel>
      menuItem(
        text = "Home", 
        tabName = "informacion_ingresada"),
      menuItem(
        text = "Registro",
        tabName = "registro"),
      menuItem(
        text = "Shop", 
        tabName = "shop"),
      menuItem(
        text = "Inventario", 
        tabName = "inventario"),
      br(),
      br(),
      #"PENDIENTE HACER QUE EL BOTON SE VEA AL FINAL DEL SIDEBAR Y NO SE PUEDA MOVER"
      br(),
      br(),
      actionButton(
        inputId = "reset_inputs",
        label = "Salida")
      )),
  
  
  body <- dashboardBody(
    use_theme(mytheme),              #mytheme is defined in global
    useShinyjs(),                    #now we can use shinyjs functions
    conditionalPanel("input.tabs == 'informacion_ingresada'",
                     br(),
                     fluidRow( 
                       column(width = 4),
                       column(width = 4,
                              h1("Validación de usuario"),
                              br(),
                              br(),
                              helpText("Ingresar cédula:"),
                              numericInput(inputId = "cc_validation_registro",
                                           label = NULL,
                                           value = NULL),
                              actionButton(inputId = "validation_button",
                                           label = "Validar")),
                       column(width = 4)
                     )),
    conditionalPanel("input.tabs == 'registro'",
                     fluidRow(
                       column(width = 3),
                       column(width =6,
                              h1("Sesión de registro"),
                              br(),
                              br(),
                              fluidRow(
                                column(width = 6,
                                       textInput(
                                         inputId = "fullname",
                                         label = "Nombre completo")),
                                column(width = 6,
                                       numericInput(
                                         inputId = "id",
                                         label = "Cédula",
                                         value = NULL))),
                              fluidRow(
                                column(width=6,
                                       textInput(
                                         inputId = "hotmail",
                                         label = "Correo",
                                         value = NULL)),
                                column(width=6,
                                       textInput(
                                         inputId = "adress",
                                         label = "Dirección",
                                         value = NULL))),
                              fluidRow(
                                column(width = 6,
                                       numericInput(
                                         inputId = "cel",
                                         label = "Número de celular",
                                         value = NULL)),
                                column(width = 6,
                                       selectInput(
                                         inputId = "pais",
                                         label = "País",
                                         choices = c(" ",
                                                     "Colombia")))),
                              fluidRow(
                                column(width = 6,
                                       selectInput(
                                         inputId = "departamentos",
                                         label = "Departamento",
                                         choices = NULL)),
                                column(width = 6,
                                       selectInput(
                                         inputId = "municipios",
                                         label = "Municipio",
                                         choices = NULL))),
                              fluidRow(
                                column(width = 1,
                                       align = "center",
                                       actionButton(
                                         inputId = "save",
                                         label = "Guardar")))),
                       column(width = 3)
                     )),
    
    conditionalPanel("input.tabs == 'shop'",
                     fluidRow(
                       column(width = 4),
                       column(width = 4,
                              h1 ("Productos"),
                              br(),
                              br(),
                              selectInput(
                                inputId = "categoria_productos",
                                label = "Seleccione categoría del producto:",
                                choices = NULL
                              ),
                              selectInput(
                                inputId = "productos",
                                label = "Seleccione el producto",
                                choices = NULL
                              ),
                              selectInput(
                                inputId = "cantidad_productos_solicitados",
                                label = "ingresar cantidad",
                                choices = c(1:20)
                              ),
                              textOutput(outputId = "payment"),
                              br(),
                              actionButton(inputId = "compra",
                                           label = "Comprar"
                              )),
                       column(width = 4)
                     )
                     ),
    conditionalPanel("input.tabs == 'inventario'",
                     tabsetPanel(
                       tabPanel(
                         h1("A este apartado solo podrá acceder el usuario administrador"),
                         inputId = "consulta_inventario",
                         title = "Consultar",
                         helpText("Aquí va tabla de inventario actual")),
                       tabPanel(
                         inputId = "agregar_inventario",
                         title = "Añadir",
                         helpText("Aquí se agregan los productos que se van a añadir 
                                  al inventario (productos ya registrados en la base)")),
                       tabPanel(
                         inputId = "registrar_inventario",
                         title = "Registrar",
                         helpText("Los productos nuevos no registrados en la base
                                  se añaden desde este medio, (tipo de producto, 
                                  producto y precio)"))
                     )
                     )
  )
)

