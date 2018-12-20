# server.R

library(shiny)
library(magrittr)
library(tidyverse)
source('chart.R')
source('table.R')
source('dat.R')

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    dat %<>%
    {
      if (identical(input$filter, 'all')) {
        .   # <= Note placeholder!
      } else if (identical(input$filter, 'zonalOffices')) {
        filter(
          .,
          office == 'NCZH'
          | office == 'NEZH'
          | office == 'NWZH'
          | office == 'SEZH'
          | office == 'SSZH'
          | office == 'SWZH'
        )
      } else if (identical(input$filter, 'stateOffices')) {
        filter(
          .,
          office == 'ANAMBRA'
          | office == 'BENUE'
          | office == 'BORNO'
          | office == 'CRS'
          | office == 'EBONYI'
          | office == 'EKITI'
          | office == 'ENUGU'
          | office == 'GOMBE'
          | office == 'IMO'
          | office == 'KADUNA'
          | office == 'KANO'
          | office == 'KATSINA'
          | office == 'KEBBI'
          | office == 'KWARA'
          | office == 'LAGOS'
          | office == 'NASS'
          | office == 'NIGER'
          | office == 'ONDO'
          | office == 'OSUN'
          | office == 'OYO'
          | office == 'PLATEAU'
          | office == 'RIVERS'
          | office == 'SOKOTO'
        )
      } else {
        filter(., office == input$singleOffice)
      }
    }
  })
  
  output$mainChart <- renderPlot({
   
    draw_bar_chart(dataInput(), input$var) %>% 
      print()
    
  })
  
  output$mainTable <- renderTable({
    d <- dataInput()
    structure (
      d %>%
        select(office:amount) %>%
        group_by(!!input$var) %>%
        summarise(Total = sum(amount)) %>% 
        as.data.frame()
    )
  })
  
})
 