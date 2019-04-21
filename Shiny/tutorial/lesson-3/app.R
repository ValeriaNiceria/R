library(shiny)


# Define UI ----
ui <- fluidPage(
  titlePanel("Basic widgets"),
  
  fluidRow(
    column(3,
           h3("Buttons"),
           actionButton("action", "Action"),
           br(),
           br(),
           submitButton("Submit")),
    column(3,
           checkboxGroupInput("checkGroup",
                              h3("Checkbox group"),
                              choices = list("choice 1" = 1,
                                             "choice 2" = 2,
                                             "choice 3" = 3),
                              selected = 1)),
    column(3,
           fileInput("file",
                     h3("File input"))),
    column(3,
           h3("Help text"),
           helpText("Note: help text isn't a true widget,",
                    "but it provides an easy to add text to",
                    "accompany other widgets.")),
    column(3,
           numericInput("num",
                        h3("Numeric input"),
                        value = 1))
  ),
  fluidRow(
    column(3,
           radioButtons("radio", h3("Radio buttons"),
                        choices = list("choice 1" = 1,
                                      "choice 2" = 2,
                                      "choice 3" = 3),
                                      selected = 1)),
    column(3,
           selectInput("select",
                       h3("Select box"),
                       choices = list("choice 1" = 1,
                                     "choice 2" = 2,
                                     "choice 3" = 3),
                       selected = 1)),
    column(3,
           sliderInput("slider1", h3("Sliders"),
                       min = 0, max = 100,
                       value = 50),
           sliderInput("slider2", "",
                       min = 0, max = 100, 
                       value = c(25, 75))),
    column(3,
           textInput("text", h3("Text input"),
                     value = "Enter text..."))
  )
)

# Define server ----
server <- function(input, output) {}


# Run the app ----
shinyApp(ui, server)