# ui.R

library(shiny)
source('dat.R')

shinyUI(fluidPage(
  
  # Application title
  titlePanel("IGR Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        'perspective',
        label = 'Label1',
        choices = c('Revenue Category' = 'revenue.source',
                    'Office' = 'office')
      ),
      
      br(),
      
      radioButtons(
        'filter',
        label = 'Office',
        choiceNames = list(
          'All offices',
          'Zonal Offices',
          'State Field Offices',
          'Individual Office'
        ),
        choiceValues = list(
          'allOffices',
          'zonalOffices',
          'stateOffices',
          'individualOffice'
        )
      ),
      
      conditionalPanel(
        "input.filter  == 'individualOffice' && 
         input.perspective != 'office'",
        selectInput(
          'singleOffice',
          label = '',
          choices = sort(unique(dat$office)),
          selected = NULL)
      ),
      
      br(), br(),
      
      checkboxInput('showTable', 'Show summary'),
      
      conditionalPanel(
        "input.showTable === true",
        checkboxInput('showStats', 'Show stats')
        ),
      
      width = 3
    ),
    
    mainPanel(
      plotOutput("mainChart"),
      conditionalPanel("input.showTable", dataTableOutput('mainTable')),
      conditionalPanel("input.showStats", tableOutput('statsTable'))
    ),
    
    position = 'right'
  )
))
