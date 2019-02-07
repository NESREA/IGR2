# dat.R

# To load the data independently into the workspace once this file is sourced
library(magrittr)

if (!exists('dat'))
  dat <- readRDS(file.path(here::here(), 'data', 'igr-data.rds'))
perspectiveVars <- colnames(dat) %>% magrittr::extract(!grepl('^amount', .))
