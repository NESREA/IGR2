# testthat.R

pkgs <- c('here', 'testthat', 'tidyverse')
lapply(pkgs, function(pkg) {
  if (!require(as.character(pkg), character.only = TRUE))
    install.packages(as.character(pkg), repos = 'https://cran.rstudio.com')
  library(as.character(pkg), character.only = TRUE)
})

# Find source files
paths <- 
  list.files(path = here(), pattern = '^(dat|table|chart)', recursive = TRUE)

lapply(paths, source)