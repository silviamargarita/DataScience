## Menus
## sidebar

library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Dynamic sidebar"),
  dashboardSidebar(
    sidebarMenu(
      textInput("dynamic", "Dynamic",
                value = "starting value"),
      
            sliderInput("dynamic", "Dynamic",
                  min = 1, max = 20, value = 10),
      
            sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                        label = "Search..."),
      
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