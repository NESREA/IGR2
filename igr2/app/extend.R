# extend.R

library(magrittr)

.extendClass <- function(x, input)
{
  if (!is.character(input))
    stop(sprintf(
      "Unexpected type for %s - '%s'",
      deparse(substitute(input)),
      typeof(input)
    ))
  
  if (!inherits(x, input)) {
    class(x) %<>%
      append(input, after = 0)
  }
  x
}