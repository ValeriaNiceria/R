library(shiny)

ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      img(src = "my_image.png", width = 300, height = 100, align = "right")
    )
  )
)

server <- function(input, output) {}

shinyApp(ui, server)