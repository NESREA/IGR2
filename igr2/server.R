# server.R

library(shiny)
library(dplyr)

# Scripts to that app-specific objects (including data)
# are loaded into the global environment
source('chart.R')
source('table.R')
source('dat.R')

shinyServer(function(input, output) {
  
  dataInput <- reactive({
    dat %>%
    {
      if (!is.null(input$singleOffice))
        filter(., office == input$singleOffice)
      else
        filter_data(., input$filter)
    }
  })
  
  output$mainChart <- renderPlot({
    draw_bar_chart(dataInput(), input$var) %>% 
      print()
  })
  
  output$mainTable <- renderTable({
    var <- as.symbol(input$var)
    make_summ_table(dataInput(), var)
  },
  striped = TRUE,
  spacing = 'xs',
  hover = TRUE,
  bordered = TRUE,
  align = 'l')
  
})
 