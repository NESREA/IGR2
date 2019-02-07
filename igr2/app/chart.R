# chart.R
library(tidyverse)

draw_bar_chart <- function(data, para) {
  stopifnot(isFALSE(is.null(para)))
  stopifnot(is.data.frame(data))

  para <-
    if (is.character(para))
      as.symbol(para)
  else
    enexpr(para)
  
  xlabel <- para %>%
    deparse %>%
    str_split('\\.') %>%
    unlist %>%
    str_c(collapse = ' ')
  
  gg <-
    ggplot(data, aes(reorder(!!para, amount), y = amount, fill = !!para)) +
    geom_col() +
    ggtitle(paste('IGR disaggregated by', sQuote(xlabel))) +
    ylab('Amount (NGN)') +
    xlab(xlabel) +
    theme(title = element_text(face = 'bold', size = rel(1.5)),
          legend.position = 'none',
          axis.text.x = element_text(face = 'plain'),
          axis.text.y = element_text(face = 'plain')) +
    coord_flip()
  print(gg)
}
