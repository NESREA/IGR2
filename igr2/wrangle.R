# wrangle.R

# Fetch the data and make it look the way I want

library(tidyverse)
library(magrittr)
library(readxl)
source('helpers.R')

options(scipen = 999)

wk.book <- 'data/2018 IGR budget performance report FOR SA.xls'
sheets <- excel_sheets(wk.book)

dt <- read_xls(
  wk.book,
  sheet = 4,
  range = 'A2:Q30',
  col_names = TRUE,
  na = '-'
)

origLabels <- colnames(dt)[-1]

colnames(dt) %<>%
  {
    .[1] <- 'OFFICE'
  } %>% {
    . <- c(
      'office',
      'con.renew',
      'nat.guid',
      'nat.reg',
      'nc.admin',
      'aud.cert',
      'aqwt.perm',
      'lab',
      'appl.emp',
      'imp.ueee',
      'res.ref.id',
      'con.reg.wshp',
      'bids',
      'bts',
      'epr.man',
      'accred.ve',
      'tender'
    )
  }

offices <- unique(dt$office)
fieldOffices <- offices %>% 
  subset(!str_detect(., 'HQ|SEZH|NCZH|SSZH|NEZH'))
zonalOffices <- offices[!(offices %in% c('HQ', fieldOffices))]

dt %<>%
  gather(revenue.source, amount, con.renew:tender) %>%
  mutate(amt_k = (amount / 1e3)) %>% 
  mutate(amt_m = amount / 1e6)

saveRDS(dt, file = 'data/igr-data.rds')
