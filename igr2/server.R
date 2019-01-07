# server.R

library(shiny)
library(magrittr)
lapply(c('chart.R', 'dat.R', 'filter-out.R', 'table.R'), source)

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
  
  output$mainChart <- renderPlot(
    draw_bar_chart(dataInput(), input$perspective)
  )
  
  output$mainTable <- renderDataTable(
    make_summ_table(dataInput(), input$perspective)
  )
  
  output$statsTable <- renderTable(
    make_stat_table(dataInput(), input$perspective)
  )
})
 