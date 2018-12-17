# ui.R

library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel(""),
  
  sidebarLayout(
    sidebarPanel(
       selectInput('id1',
                   label = 'Label1',
                   choices = c('Revenue Category' = 'revenue.source',
                               'Office' = 'office'))
    ),
    
    mainPanel(
      plotOutput("mainChart")
      # textOutput("mainText")
    )
  )
))
