# chart.R

library(tidyverse)

draw_bar_chart <- function(data, para) {
  if (!is.symbol(para))
    para <- as.symbol(para)
  
  para <- enexpr(para)
  
  xlabel <- para %>%
    deparse %>%
    str_split('\\.') %>%
    unlist %>%
    str_c(collapse = ' ')
  
  stub <- 'IGR disaggregated by'
  
  gg <-
    ggplot(data, aes(reorder(!!para, amt_m), y = amt_m, fill = !!para)) +
    geom_col() +
    ggtitle(paste(stub, sQuote(xlabel))) +
    ylab('Amount (N million)') +
    xlab(xlabel) +
    theme(title = element_text(face = 'bold', size = rel(1.5)),
          legend.position = 'none',
          axis.text.x = element_text(face = 'plain'),
          axis.text.y = element_text(face = 'plain')) +
    coord_flip()
  print(gg)
}
