# ui.R

library(shiny)
source('dat.R')

rightSide <- 3L
chartWidth <- 9L



shinyUI(fluidPage(
  # Header Row
  fluidRow(
    column(width = 2,
           img(src = "nesrea_logo.png", 
               alt = "NESREA logo", 
               style = 'width:120px;height:100px'),
           br(),
           br()
    ),
    column(width = 6,
           titlePanel("IGR Analysis, 2018", 'NESREA IGR')
    )
  ),
  
  # Plot Area Row
  fluidRow(
    column(width = chartWidth,
           plotOutput("mainChart")
    ),
    column(width = rightSide,
           
           br(),
           
           wellPanel(
             selectInput(
               'perspective',
               label = '',
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
             
             br(),
             
             conditionalPanel(
               "input.filter  == 'individualOffice' &&
               input.perspective != 'office'",
               selectInput(
                 'singleOffice',
                 label = '',
                 choices = sort(unique(dat$office)),
                 selected = NULL
               )
             ),
             
             hr(),
             
             checkboxInput('showSummary', 'Show Summary'),
             
             conditionalPanel(
               "input.showSummary",
               checkboxInput('showStats', 'Show Stats')
             )
           )
           
    )
  ),
      
  fluidRow(
    column(width = 4,
           conditionalPanel(
             "input.showSummary", tableOutput('summaryTable')
           )),
    column(width = 5,
           conditionalPanel(
             "input.showStats", tableOutput('statsTable')
           ))
  )
  
))
