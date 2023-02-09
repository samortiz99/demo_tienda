ui <- dashboardPage(
  
  head <- dashboardHeader(title = "FORMULARIO"),
  
  sidebar <- dashboardSidebar(
    sidebarMenu(id = "tabs",          #this argument will be used in <conditionalPanel>
      menuItem(
        text = "Home", 
        tabName = "informacion_ingresada"),
      menuItem(
        text = "Shop", 
        tabName = "shop"))),
   
  
  body <- dashboardBody(
    use_theme(mytheme),              #mytheme is defined in global
    useShinyjs(),
    
    conditionalPanel("input.tabs == 'informacion_ingresada'",
                     tabsetPanel(
                       tabPanel(title ="Validar registro",
                                br(),
                                fluidRow( #Se añaden 3 columns y se elige la del centro para centrar el input
                                  column(width = 4),
                                  column(width = 4,
                                         helpText("Ingresar cédula:"),
                                         numericInput(inputId = "cc_validation_registro",
                                                      label = NULL,
                                                      value = NULL),
                                         actionButton(inputId = "validation_button",
                                                      label = "Validar")),
                                  column(width = 4))),
                                
                       tabPanel(title = "Registro",
                                br(), #br is used to make a small enter in the ui
                                fluidRow(
                                  column(width = 3),
                                  column(width =6,
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
                                  )
                                )
                       )
                     ),
    
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
                     )
  )
)

