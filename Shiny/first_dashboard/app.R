install.packages(c("shiny", "shinydashboard"))

library(shiny)
require(shinydashboard)

ui <- dashboardPage(
  dashboardHeader(title = 'Basic dashboard'),
  dashboardSidebar(),
  dashboardBody(
    fluidRow(
      box(plotOutput('plot1', height = 250)),
      box(
        title = 'Controls',
        sliderInput('slider', 'Number of observations:', 1, 100, 50)
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plo1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)
