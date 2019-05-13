# install.packages("shiny")
# install.packages("shinydashboard")

library(shiny)
library(shinydashboard)

# Define UI ----
ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard",
                  tags$link(rel = "stylesheet", type = "text/css", href = "style.css")),
  # Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
  ),
  # Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controls",
                  sliderInput("slider", "Number of observations:", 1, 100, 50)
                )
              )),
      
      # Second tab content
      tabItem(tabName = "widgets",
              h2("Widgets tab content"))
    )
  )
)

# Define server ----
server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

# Run the app
shinyApp(ui, server)