# chart.R

library(tidyverse)

draw_bar_chart <- function(data, para) {
  if (!is.symbol(para))
    para <- as.symbol(para)
  para <- enexpr(para)
  xlabel <- para %>% 
    deparse() %>% 
    str_split('\\.') %>% 
    unlist() %>% 
    str_c(collapse = ' ')
  stub <- 'IGR disaggregated by'
  data %>%
    ggplot(aes(reorder(!!para, amt_m), y = amt_m, fill = !!para)) +
    geom_col() +
    coord_flip() +
    ggtitle(paste(stub, xlabel)) +
    ylab('Amount (N million)') +
    xlab(xlabel) +
    theme(legend.position = 'none',
          axis.text.x = element_text(deparse(para)))
}
