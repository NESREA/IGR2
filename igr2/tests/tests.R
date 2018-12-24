# tests.R

source(file.path(here::here(), 'tests', 'testthat.R'))

context("Rendering of table(s)")

test_that('Summary table is properly created', {
  
  t.o <- make_summ_table(dat, office)
  t.r <- make_summ_table(dat, revenue.source)
  
  expect_is(t.o, 'data.frame')
  expect_false(inherits(t.o, 'tbl_df'))
  expect_false(inherits(t.o, 'tbl'))
  expect_is(t.r, 'data.frame')
  expect_false(inherits(t.o, 'tbl_df'))
  expect_false(inherits(t.o, 'tbl'))
})

