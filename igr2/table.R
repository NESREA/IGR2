# table.R

library(dplyr)
library(rlang)


make_summ_table <- function(data, para) {
  stopifnot(is.data.frame(data))
  stopifnot(is.symbol(para))
  
  para <- enexpr(para)
  data %>%
    select(office:amount) %>%
    group_by(!!para) %>%
    summarise(
      Total = sum(amount),
      Mean = mean(amount, na.rm = TRUE),
      Median = median(amount, na.rm = TRUE)
    ) %>%
    as.data.frame()
}


make_stat_table <- function(data) {
  
}