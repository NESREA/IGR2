# testthat.R

pkgs <- c('here', 'testthat', 'tidyverse')
lapply(pkgs, function(pkg) {
  if (!require(as.character(pkg), character.only = TRUE))
    install.packages(as.character(pkg), repos = 'https://cran.rstudio.com')
  library(as.character(pkg), character.only = TRUE)
})

# Data source
source(file.path(here(), 'dat.R'))

# Function source
source(file.path(here(), 'table.R'))