# wrangle.R: Fetch the data and make it look the way I want

library(dplyr)
library(magrittr)
library(readxl)
library(here)

source(file.path(here(), 'app', 'helpers.R'))

wk.book <-
  file.path(here(),
            'data',
            '2018 IGR budget performance report FOR SA.xls')
dt <- read_xls(
  wk.book,
  sheet = 4,
  range = 'A2:Q30',
  col_names = TRUE,
  na = '-'
) %>%
  setNames(c('office', revenueCategory))

offices <- unique(dt$office)

fieldOffices <- offices %>% 
  subset(!str_detect(., 'HQ|SEZH|NCZH|SSZH|NEZH'))

zonalOffices <- offices[!(offices %in% c('HQ', fieldOffices))]

dt %<>%
  gather(revenue.source, amount, con.renew:tender) %>%
  mutate(revenue.source = factor(
    revenue.source,
    levels = revenueCategory,
    labels = names(revenueCategory)
  )) %>%
  mutate(amount_k = (amount / 1e3)) %>%
  mutate(amount_m = amount / 1e6)

saveRDS(dt, file = file.path(here(), 'data', 'igr-data.rds'))
