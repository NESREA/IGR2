# body.R

# User Inerface: Body of the Shiny Dashboard
sapply(c('shiny', 'shinydashboard'), library, character.only = TRUE)
source('dat.R')

uiBody <-
  dashboardBody(
    fluidRow(
      
      column(width = 9L,
             plotOutput("mainChart")), 
      
      column(width = 3L,
             wellPanel(
               selectInput('perspective',
                           label = 'Choose perspective: ',
                           choices = structure(c('', perspectiveVars),
                                               names = c('', stringr::str_to_title(perspectiveVars)))), 
               radioButtons(
                 'filter',
                 label = 'Office',
                 choiceNames = list(
                   'All offices',
                   'Zonal Offices',
                   'State Field Offices',
                   'Individual Office'
                 ),
                 choiceValues = list('allOffices',
                                     'zonalOffices',
                                     'stateOffices',
                                     'individualOffices')
               ), 
               conditionalPanel(
                 "input.filter  == 'individualOffices' &&
                 input.perspective != 'office'",
                 selectInput(
                   'justOneOffice',
                   label = '',
                   choices = sort(unique(dat$office)),
                   selected = NULL
                 )
               ), 
               checkboxInput('showSummary', 'Show Summary'), 
          
               conditionalPanel("input.showSummary",
                                checkboxInput('showStats', 'Show Stats'))
             ))), 
    fluidRow(column(
      width = 2,
      conditionalPanel(
        "input.showSummary",
        tags$span(tags$strong('Summary Table')),
        tableOutput('summaryTable')
      )
    ),
    
    column(
      width = 9,
      conditionalPanel(
        "input.showStats",
        tags$span(tags$strong('Statistics')),
        tableOutput('statsTable')
      )
    ))
  )
