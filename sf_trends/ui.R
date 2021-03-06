library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  h2("Delta and  Suisun weighted regression results"),
  
  # Sidebar with a slider input for number of observations
  fluidRow(
    
    column(2, 
      
      selectInput(inputId = 'stat',
        label = h4('Station'),
        choices = c('C10', 'C3', 'MD10', 'P8', 'D19', 'D26', 'D28', 'D4', 'D6', 'D7'), 
        selected = 'C10')
      
    ),

    column(2, 
            
      selectInput(inputId = 'res', 
        label = h4('Variable'),
        choices = c('din', 'nh', 'no23', 'sio2', 'tp', 'tss', 'chl'), 
        selected = 'din')
        
    ),
    
    column(2, 
      
      selectInput(inputId = 'annuals', 
        label = h4('Plot type'), 
        choices = c('annual', 'observed'), 
        selected = 'observed'
        )
      
    ),
    
    column(2, 
      
      selectInput(inputId = 'scl', 
        label = h4('Scale type'), 
        choices = c('natural log', 'linear'), 
        selected = 'linear'
        )
      
    ),
    
    column(2, 
      
      uiOutput("daterng")
      
    ),
    
    column(width = 2,
      radioButtons(inputId = 'remobs', 
        label = h4('Remove observed?'),
        choices = c(TRUE, FALSE),
        selected = c(FALSE), 
        inline = TRUE
      )
    ),
    
    width = 12
    
  ),
  
  # output tabs
  mainPanel(
    
    plotOutput("floplot", height = "100%"),
    plotOutput("fitplot", height = "100%"),
    plotOutput("nrmplot", height = "100%"),
   
    width = 9
      
  )

))