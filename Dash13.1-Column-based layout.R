##  infoBoxes ##

library(shinydashboard)
body <- dashboardBody(
  fluidRow(
    column(width = 4,
           box(
             title = "Box title", width = NULL, status = "primary",
             "Box content"
           ),
           box(
             title = "Title 1", width = NULL, solidHeader = TRUE, status = "primary",
             "Box content"
           ),
           box(
             width = NULL, background = "black",
             "A box with a solid black background"
           )
    ),
    
    column(width = 4,
           box(
             status = "warning", width = NULL,
             "Box content"
           ),
           box(
             title = "Title 3", width = NULL, solidHeader = TRUE, status = "warning",
             "Box content"
           ),
           box(
             title = "Title 5", width = NULL, background = "light-blue",
             "A box with a solid light-blue background"
           )
    ),
    
    column(width = 4,
           box(
             title = "Title 2", width = NULL, solidHeader = TRUE,
             "Box content"
           ),
           box(
             title = "Title 6", width = NULL, background = "maroon",
             "A box with a solid maroon background"
           )
    )
  )
)

# We'll save it in a variable `ui` so that we can preview it in the console
ui <- dashboardPage(
  dashboardHeader(title = "Column layout"),
  dashboardSidebar(),
  body
)

# Preview the UI in the console
shinyApp(ui = ui, server = function(input, output) { })