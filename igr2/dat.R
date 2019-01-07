# dat.R

if (!exists('dat'))
  dat <-
    readr::read_rds(file.path(here::here(), 'data', 'igr-data.rds'))
