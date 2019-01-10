# table.R

library(dplyr)
library(magrittr)
library(rlang)



make_summ_table <- function(data, param) {
  .validateTabulationInputs(data, param)
  .sumUpTheData(data, param) %>% 
    arrange(desc(Total)) %>% 
    mutate(Total = format(round(Total), big.mark = ','))
}


make_stat_table <- function(data, param) {
  .validateTabulationInputs(data, param)
  .sumUpTheData(data, param) %$%   # magrittr exposition operator
  {
    fivenum(Total) %>% 
      append(mean(Total, na.rm = TRUE), after = 2) %>% 
      { format(round(.), big.mark = ',') }
  } %>% 
    matrix(ncol = length(.)) %>% 
    as.data.frame() %>% 
    setNames(c('Min.', 'L.H.', 'Mean', 'Median', 'U.H.', 'Max.'))
}


## Aggregates the data along the lines of 'input' parameter
## and returns the new data frame
.sumUpTheData <- function(df = data.frame(), input = character())
{
  input <- if (!is.symbol(input))
    as.symbol(input)
  df %>%
    group_by(!!input) %>%
    summarise(Total = sum(amount))
}



.validateTabulationInputs <- function(data, input)
{
  stopifnot(is.data.frame(data))
  stopifnot(is.character(input))
}