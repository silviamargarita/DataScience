## Menus
## sidebar
## tasks

library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Dynamic sidebar"),
  dashboardSidebar(
    sidebarMenu(
      menuItemOutput("menuitem1")
    )
  ),
  dashboardBody()
)

server <- function(input, output) {
  output$menuitem1 <- renderMenu({
    menuItem("Menu item", icon = icon("calendar"))
  })
}

shinyApp(ui, server)