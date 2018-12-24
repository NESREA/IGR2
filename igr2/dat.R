# dat.R

if (!exists('dat'))
  dat <-
    readr::read_rds(file.path(here::here(), 'data', 'igr-data.rds'))



filter_data <- function(data, param) {
  stopifnot(is.data.frame(data))
  stopifnot(is.character(param))
  
  data %>%
  {
    if (identical(param, 'all')) {
      .   # <= Note the placeholder!
    } else if (identical(param, 'zonalOffices')) {
      filter(
        .,
        office == 'NCZH'
        | office == 'NEZH'
        | office == 'NWZH'
        | office == 'SEZH'
        | office == 'SSZH'
        | office == 'SWZH'
      )
    } else if (identical(param, 'stateOffices')) {
      filter(
        .,
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
  }
}