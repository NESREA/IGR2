# dat.R

# To load the data independently into the workspace once this file is sourced

if (!exists('dat'))
  dat <-
    readr::read_rds(file.path(here::here(), 'data', 'igr-data.rds'))
