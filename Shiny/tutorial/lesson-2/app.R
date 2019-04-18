library(shiny)

ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(
      h1("Installation"),
      p("Shiny is available on CRAN, so you can install it in the usual way from your R console:"),
      code("install.packages('shiny')"),
      br(),
      div(style="height: 50px"),
      img(src = "my_image.png", width = 150, heigth = 80),
      p("Shiny is a product of", 
        a(href = "https://www.rstudio.com/", "RStudio")
      )
    ),
    mainPanel(
      h1("Introducing Shiny"),
      p("Shiny is a new package from RStudio that makes it ", 
        em("incredibly easy"),
        " to build interactive web applications with R."),
      br(),
      div(style = "heigth: 30px"),
      p("For an introduction and live examples, visit the ",
        a(href = "https://shiny.rstudio.com/", "Shiny homepage.")),
      br(),
      div(style="heigth: 30px"),
      h1("Features"),
      p("- Build useful web applications with only a few lines of code-no JavaScript required."),
      p("- Shiny applications are automatically 'live' in the same way that ", 
        strong("spreadsheets"), 
        "are live. Outputs change instantly as users modify inputs, without requiring a reload of the browser."
      )
    )
  )
)

server <- function(input, output) {}

shinyApp(ui, server)