# server.R

library(shiny)
library(magrittr)
library(tidyverse)
source('helpers.R')

shinyServer(function(input, output) {
  
  dat <- read_rds('data/igr-data.rds')
  
  dataInput <- reactive({
    
    if (identical(input$filter, 'zonalOffices')) {
      dat %<>% 
        filter(
          office == 'NEZH'
          | office == 'SEZH'
          | office == 'NCZH' 
          | office == 'SSZH'
          )
    }
    dat
  })
  
  output$mainChart <- renderPlot({
   
    draw_bar_chart(dataInput(), input$id1) %>% 
      print()
    
  })
  
  # output$mainText <- renderText({
  #   input$id1
  # })
  
})
