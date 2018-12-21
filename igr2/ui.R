# ui.R

library(shiny)
source('dat.R')

shinyUI(fluidPage(
  
  # Application title
  titlePanel("IGR Analysis"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        'var',
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
          'Other (Specify)'
        ),
        choiceValues = list('all', 'zonalOffices', 'stateOffices', 'other')
      ),
      
      conditionalPanel(
        "input.filter  == 'other'",
        selectInput('singleOffice', label = '', choices = sort(unique(dat$office)))
      ),
      
      br(), br(),
      
      checkboxInput('showTable', 'Display stats')
    ),
    
    mainPanel(
      plotOutput("mainChart"),
      conditionalPanel("input.showTable", dataTableOutput('mainTable'))
      
    )
  )
))
