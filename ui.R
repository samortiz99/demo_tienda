ui <- dashboardPage(
  
  head <- dashboardHeader(title = "tienda a relacionar"),
  
  sidebar <- dashboardSidebar(
    sidebarMenu(id = "tabs", #this argument will be used in <conditionalPanel>
      menuItem(text = "Home", tabName = "informacion_ingresada"),
      menuItem(text = "Shop", tabName = "shop"))),
  
  
  body <- dashboardBody(
    
    conditionalPanel("input.tabs == 'informacion_ingresada'",
                     tabsetPanel(
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
                                           "")),
                                  column(width = 3,
                                         selectInput(
                                           inputId = "municipios",
                                           label = "Municipio",
                                           ""))),
                                br(),
                                fluidRow(
                                  column(width = 1,
                                         align = "center",
                                         actionButton(
                                           inputId = "save",
                                           label = "Guardar"))),
                                reactableOutput(outputId = "table")),
                       
                       tabPanel(title ="Validar registro",
                                br(),
                                helpText("Si quiere confirmar su registro, ingrese su identificación aquí:")))),
    
    conditionalPanel("input.tabs == 'shop'",
                     tabsetPanel(
                       tabPanel(title ="Crear nuevo grupo",
                                helpText("Por favor registre el nombre del nuevo grupo:")),
                       tabPanel(title ="in shop",
                                helpText("Aquí se vende"))
                     )
                     )
  )
)