# filter_out.R

# Generic
filter_out <- function(x, selection = NULL)
  UseMethod("filter_out")




# Methods
filter_out.allOffices <- function(x, selection = NULL) {
  .validateInput(x)
  x
}





filter_out.zonalOffices <- function(x, selection = NULL)
{
  .validateInput(x)
  x %>%
    filter(
      office == 'NCZH'
      | office == 'NEZH'
      | office == 'NWZH'
      | office == 'SEZH'
      | office == 'SSZH'
      | office == 'SWZH'
    )
}





filter_out.stateOffices <- function(x, selection = NULL)
{
  .validateInput(x)
  x %>% 
    filter(
      office == 'ANAMBRA'
      | office == 'BENUE'
      | office == 'BORNO'
      | office == 'CRS'
      | office == 'EBONYI'
      | office == 'EKITI'
      | office == 'ENUGU'
      | office == 'GOMBE'
      | office == 'IMO'
      | office == 'KADUNA'
      | office == 'KANO'
      | office == 'KATSINA'
      | office == 'KEBBI'
      | office == 'KWARA'
      | office == 'LAGOS'
      | office == 'NASS'
      | office == 'NIGER'
      | office == 'ONDO'
      | office == 'OSUN'
      | office == 'OYO'
      | office == 'PLATEAU'
      | office == 'RIVERS'
      | office == 'SOKOTO'
    )
}





filter_out.individualOffice <- function(x, selection = character())
{
  .validateInput(x, selection)
  x %>% 
    filter(office == selection)
}





.validateInput <- function(arg1, arg2 = NULL)
{
  if (!is.data.frame(arg1))
    stop(sQuote(arg), 'is not a data frame')
  if (!is.null(arg2) & !is.character(arg2))
    stop(arg2, 'is not a character vector')
  if (length(arg2 > 1)) {
    arg2 <- arg2[1]
    warning(
      sprintf('Length of \'%s\' > 1 and only first element was used', arg2)
      )
  }
}
