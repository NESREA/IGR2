# server.R

library(shiny)
library(magrittr)
library(here)

lapply(c('chart.R', 'dat.R', 'filter-out.R', 'table.R'), source)

## Note: The data are made available via dat.R

shinyServer(function(input, output) {
  ## Set S3 class and then call the right method 
  ## of 'filter_out()' for data manipulation
  dataInput <- reactive({
    if (!inherits(dat, input$filter)) {
      class(dat) %<>%
        append(input$filter, 0)
    }
    dat %>% 
      filter_out(input$singleOffice)
  })
  
  output$mainChart <- renderPlot({
    draw_bar_chart(dataInput(), input$perspective)
  })
  
  output$summaryTable <- renderTable({
    make_summ_table(dataInput(), input$perspective)
  },
  striped = TRUE,
  bordered = TRUE,
  spacing = 'xs',
  width = "70")
  
  output$statsTable <- renderTable({
    make_stat_table(dataInput(), input$perspective)
  },
  striped = TRUE,
  bordered = TRUE,
  spacing = 'xs',
  width = "70")
})
 