# server.R

lapply(c('here', 'magrittr', 'shiny'), library, character.only = TRUE)
lapply(c('chart.R', 'dat.R', 'extend.R', 'filter-out.R', 'table.R'),
       source)
## Note: The data are made available via dat.R

shinyServer(function(input, output) {
  dataInput <- reactive({
    .extendClass(dat, input$filter) %>%
      filter_out(input$justOneOffice)
  })

  # observe({
  #   if (input$filter == 'individualOffices') {
  #     perspectiveVars[!perspectiveVars %in% input$filter] %>% {
  #       updateSelectInput(session, 'perspective', choices = c('', .))
  #     }
  #   }
  # })

  output$mainChart <-
    renderPlot(draw_bar_chart(dataInput(), input$perspective))

  output$summaryTable <-
    renderTable(make_summ_table(dataInput(), input$perspective),
                striped = TRUE, bordered = TRUE, spacing = 'xs', width = "70")

  output$statsTable <-
    renderTable(make_stat_table(dataInput(), input$perspective),
                striped = TRUE, bordered = TRUE, spacing = 'xs',  width = "70")
})
 