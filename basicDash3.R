library(palmerpenguins)
library(ggplot2)
data(penguins, package = "palmerpenguins")


cards <- list(
  card(
    full_screen = TRUE,
    card_header("Bill Length"),
    plotOutput("bill_length")
  ),
  card(
    full_screen = TRUE,
    card_header("Bill depth"),
    plotOutput("bill_depth")
  ),
  card(
    full_screen = TRUE,
    card_header("Body Mass"),
    plotOutput("body_mass")
  )
)

color_by <- varSelectInput(
  "color_by", "Color by", 
  penguins[c("species", "island", "sex")], 
  selected = "species"
)

ui <- page_sidebar(
  title = "Penguins dashboard",
  sidebar = color_by,
  !!!cards
)

server <- function(input, output) {
  gg_plot <- reactive({
    ggplot(penguins) + 
      geom_density(aes(fill = !!input$color_by), alpha = 0.2) +
      theme_bw(base_size = 16) +
      theme(axis.title = element_blank())
  }) 
  
  output$bill_length <- renderPlot(gg_plot() + aes(bill_length_mm))
  output$bill_depth <- renderPlot(gg_plot() + aes(bill_depth_mm))
  output$body_mass <- renderPlot(gg_plot() + aes(body_mass_g))
}

shinyApp(ui, server)