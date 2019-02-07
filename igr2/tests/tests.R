# tests.R

source(file.path(here::here(), 'tests', 'testthat.R'))

context("Rendering of table(s)")

test_that('Summary table is properly created', {
  
  t.o <- make_summ_table(dat, 'office')
  t.r <- make_summ_table(dat, 'revenue.source')
  
  expect_is(t.o, 'data.frame')
  expect_true(inherits(t.o, 'tbl_df'))
  expect_true(inherits(t.o, 'tbl'))
  expect_is(t.r, 'data.frame')
  expect_true(inherits(t.o, 'tbl_df'))
  expect_true(inherits(t.o, 'tbl'))
})


context("Rendering of plot")


context('Polymorphism for data frame filter')

testStr <- 'input validation is robust'

test_that(paste('Chart', testStr), {
  expect_null(.validateInput(data.frame(), character()))
  expect_error(.validateInput(), 
               'argument "arg1" is missing, with no default')
  expect_warning(.validateInput(data.frame(), character(2)))
})

test_that(paste("Table", testStr), {
  expect_error(.validateTabulationInputs())
  expect_error(.validateTabulationInputs(data = character(), input = ""))
  expect_error(.validateTabulationInputs(data = numeric(), ""))
  expect_error(.validateTabulationInputs(logical(), ""))
  expect_error(.validateTabulationInputs(NULL, ''))
  expect_error(.validateTabulationInputs(data.frame(), data.frame()))
  expect_error(.validateTabulationInputs(data.frame(), numeric()))
  expect_error(.validateTabulationInputs(data.frame(), logical()))
  expect_silent(.validateTabulationInputs(data.frame(), character()))
})


test_that(paste('Class extension', testStr), {
  x <- NULL
  expect_error(object = .extendClass(data.frame(), x), 
               regexp = "Unexpected type for x - 'NULL'")
  invisible(lapply(list(3, FALSE, pi, matrix(1), raw(42)), function(x) {
    expect_error(.extendClass(data.frame(), x))
  }))
})