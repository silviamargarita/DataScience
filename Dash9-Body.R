## app.R ##
library(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  dashboardSidebar(),
  dashboardBody(
    # Boxes need to be put in a row (or column)
    fluidRow(
      
      box(
        title = "Histograma",
        plotOutput("plot1", height = 250)
      ),
      
      box(
        "Box content here", br(), "More box content",
        sliderInput("slider", "Slider input:", 1, 100, 50),
        textInput("text", "Text input:")
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  histdata
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)

shinyApp(ui, server)