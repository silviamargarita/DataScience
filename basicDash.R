library(shiny)
library(bslib)

ui <- page_sidebar(
  title = "My dashboard",
  sidebar = "Sidebar",
  "Main content area"
)

shinyApp(ui, function(input, output) {})