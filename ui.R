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
                                                      label = "Validar"),
                                         textOutput(outputId = "user_validation"),
                                         helpText("Agregar los colores propuestos en la presentación excel")),
                                         ),
                                  column(width = 4)),
                                
                       tabPanel(title = "Registro",
                                br(), #br is used to make a small enter in the ui
                                fluidRow(
                                  column(width = 3,
                                         textInput(
                                           inputId = "fullname",
                                           label = "Nombre completo")),
                                  column(width = 3,
                                         numericInput(
                                           inputId = "id",
                                           label = "Cédula",
                                           value = NULL))),
                                fluidRow(
                                  column(width=3,
                                         textInput(
                                           inputId = "hotmail",
                                           label = "Correo",
                                           value = NULL)),
                                  column(width=3,
                                         textInput(
                                           inputId = "adress",
                                           label = "Dirección",
                                           value = NULL))),
                                fluidRow(
                                  column(width = 3,
                                         numericInput(
                                           inputId = "cel",
                                           label = "Número de celular",
                                           value = NULL)),
                                  column(width = 3,
                                         selectInput(
                                           inputId = "pais",
                                           label = "País",
                                           choices = c(" ",
                                                       "Colombia",
                                                       "Venezuela")))),
                                fluidRow(
                                  column(width = 3,
                                         selectInput(
                                           inputId = "departamentos",
                                           label = "Departamento",
                                           choices = NULL)),
                                  column(width = 3,
                                         selectInput(
                                           inputId = "municipios",
                                           label = "Municipio",
                                           choices = NULL))),
                                fluidRow(
                                  column(width = 1,
                                         align = "center",
                                         actionButton(
                                           inputId = "save",
                                           label = "Guardar"))),
                                reactableOutput(outputId = "table"))
                       )
                     ),
    
    conditionalPanel("input.tabs == 'shop'",
                     tabsetPanel(
                       tabPanel(title ="productos",
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
                                numericInput(
                                  inputId = "cantidad_productos_solicitados",
                                  label = "ingresar cantidad",
                                  value = NULL
                                ),
                                helpText("Aquí va un textOutput con el valor a pagar"),#eliminar esto
                                textOutput(outputId = "payment"),
                                actionButton(inputId = "agregar_al_carrito",
                                             label = "Añadir al carrito"
                                             )),
                       
                       ##PENDIENTE AGREGAR LOS PRODUCTOS, QUE SEAN VISIBLES SOLO SI EL USUARIO ESTÁ REGISTRADO
                       
                       tabPanel(title ="carrito",
                                br(),
                                helpText("información del usuario"),
                                helpText("pedidos realizados"),
                                helpText("valor a pagar"))
                     )
                     )
  )
)

