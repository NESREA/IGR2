# server.R

library(shiny)
library(magrittr)
source('helpers.R')

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    read_rds('data/igr-data.rds')
  })
  
  output$mainChart <- renderPlot({
   
    draw_bar_chart(dataInput(), input$id1) %>% 
      print()
    
  })
  
  # output$mainText <- renderText({
  #   input$id1
  # })
  
})
