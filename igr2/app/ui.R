# ui.R

library(shinydashboard)
sapply(c('body.R', 'menu.R'), source)

dashboardPage(
  dashboardHeader(title = "IGR Analysis, 2018",
                  menuElement),
  dashboardSidebar(),
  uiBody
)
