# table.R

make_table <- function(data, para) {
  stopifnot(is.data.frame(data))
  stopifnot(is.symbol(para))
  
  para <- enexpr(para)
  data %>% 
    select(office:amount) %>% 
    group_by(!!para) %>% 
    summarise(Total = sum(amount)) %>% 
    as.data.frame()
}
