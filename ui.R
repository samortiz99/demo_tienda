ui <- dashboardPage(
  
  head <- dashboardHeader(
    title = HTML(
      "<div style = 'vertical-align:middle'>
      tienda a relacionar
      </div>") #no me sirve este code
  ),
  
  
  sidebar <- dashboardSidebar(
    disable = TRUE),
  
  
  body <- dashboardBody(
    
    fluidRow(
      column(width = 3,
             textInput(
               inputId = "fullname",
               label = "Nombre completo"
              )
             ),
      column(width = 3,
             numericInput(
               inputId = "id",
               label = "Cédula",
               value = NULL
              )
             )
      ),
    
    fluidRow(
      column(width=3,
             textInput(
               inputId = "hotmail",
               label = "Correo",
               value = NULL
             )
            ),
      column(width=3,
             textInput(
               inputId = "adress",
               label = "Dirección",
               value = NULL
             )
      )
    ),
    
    fluidRow(
      column(width = 3,
             numericInput(
               inputId = "cel",
               label = "Número de celular",
               value = NULL
              )
             ),
      column(width = 3,
             selectInput(
               inputId = "pais",
               label = "País",
               choices = c(" ",
                           "Colombia",
                           "Venezuela")
             )
            )
    ),
    
    fluidRow(
      column(width = 3,
             selectInput(
               inputId = "departamentos",
               label = "Departamento",
               ""
             )
            ),
      column(width = 3,
             selectInput(
               inputId = "municipios",
               label = "Municipio",
               ""
             )
            )
    ),
    
    fluidRow(
      column(width = 1,
             align = "center",
             actionButton(
               inputId = "save",
               label = "Guardar"
             )
            )
    ),
    
    reactableOutput(outputId = "table")
  )
)