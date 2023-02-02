ui <- dashboardPage(
  
  head <- dashboardHeader(
    title = HTML(
      "<div style = 'vertical-align:middle'>
      tienda a relacionar
      </div>" #no me sirve este code

      
    )
    
  ),
  
  sidebar <- dashboardSidebar(
    disable = TRUE
  ),
  
  body <- dashboardBody(
    textInput(inputId = "fullname", 
              label = "Nombre completo"
              ),
    
    numericInput(inputId = "id",
              label = "Cédula",
              value = NULL),
    
    textInput(inputId = "hotmail",
              label = "Correo"
              ),
    
    textInput(inputId = "direction",
              label = "Dirección"
              ),
    
    numericInput(inputId = "cel",
              label = "Número de celular",
              value = NULL
              ),
    
    selectInput(inputId = "pais",
                label = "País",
                choices = c(" ",
                            "Colombia",
                            "Venezuela")),
    
    selectInput(inputId = "departamentos",
                label = "Departamento",
                ""
                ),
    
    selectInput(inputId = "municipios",
                label = "Municipio",
                ""
                ),
    
    actionButton(inputId = "save",
                 label = "Guardar"
                 ),
    
    reactableOutput(outputId = "table")
  )
)