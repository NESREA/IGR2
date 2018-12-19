# ui.R

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel(""),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        'id1',
        label = 'Label1',
        choices = c('Revenue Category' = 'revenue.source',
                    'Office' = 'office')
      ),
      
      radioButtons(
        'filter',
        label = 'Office',
        choiceNames = list(
          'All offices',
          'Zonal Offices',
          'State Field Offices',
          'Other (Specify)'
        ),
        choiceValues = list('All', 'zonalOffices', 'stateOffices', 'Other')
      )
    ),
    
    mainPanel(
      plotOutput("mainChart")
      # textOutput("mainText")
    )
  )
))
