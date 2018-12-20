# table.R

make_table <- function(data, para) {
  enexpr(para)
  
  data %>% 
    group_by(!!para) %>% 
    summarise(sum(amount)) %>% 
    as.data.frame()
}

# sumOffice <- dat %>%
#   group_by(office) %>%
#   summarise(sum(amount)) %>%
#   as.data.frame()
