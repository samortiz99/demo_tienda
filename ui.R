ui <- dashboardPage(
  
  head <- dashboardHeader(
    title = HTML(
      "<div style = 'vertical-align:middle'>
      tienda a relacionar
      </div>", #no me sirve este code

      
    )
    
  ),
  
  sidebar <- dashboardSidebar(
    disable = TRUE
  ),
  
  body <- dashboardBody(
    textInput(inputId = "fullname", 
              label = "Nombre completo"
              ),
    
    textInput(inputId = "id",
              label = "Cédula"
              ),
    
    textInput(inputId = "hotmail",
              label = "Correo"
              ),
    
    textInput(inputId = "direction",
              label = "Dirección"
              ),
    
    textInput(inputId = "cel",
              label = "Número de celular"
    ),
  )
)