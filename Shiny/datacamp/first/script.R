# install.packages("shiny")
# install.packages("ggplot2")
# install.packages("DT")
# install.packages("dplyr")

library(shiny)
library(ggplot2)
library(dplyr)
library(DT)


load(url("http://s3.amazonaws.com/assets.datacamp.com/production/course_4850/datasets/movies.Rdata"))
n_total <- 651
all_studios <- sort(unique(movies$studio))

# Define UI for application that plots features of movies
ui <- fluidPage(
  
  # Sidebar layout with a input and output definitions
  sidebarLayout(
    
    # Inputs
    sidebarPanel(
    
      # Select variable for y-axis
      selectInput(inputId = "y",
                  label = "Y-axis:",
                  choices = c("IMDB rating" = "imdb_rating", 
                              "IMDB number of votes" = "imdb_num_votes", 
                              "Critics score" = "critics_score", 
                              "Audience_score" = "audience_score", 
                              "Runtime" = "runtime"),
                  selected = "imdb_rating"),
      
      # Select variable for x-axis
      selectInput(inputId = "x",
                  label = "X-axis:",
                  choices = c("IMDB rating" = "imdb_rating", 
                              "IMDB number of votes" = "imdb_num_votes", 
                              "Critics score" = "critics_score", 
                              "Audience score" = "audience_score", 
                              "Runtime" = "runtime"),
                  selected = "imdb_num_votes"),
      
      # Select variable for color
      selectInput(inputId = "z",
                  label = "Color by:",
                  choices = c("Title type" = "title_type", 
                              "Genre" = "genre", 
                              "MPAA rating" = "mpaa_rating", 
                              "Critics rating" = "critics_rating", 
                              "Audience rating" = "audience_rating"),
                  selected = "mpaa_rating"),
      
      # Alpha level
      sliderInput(inputId = "alpha",
                  label = "Alpha:",
                  min = 0, max = 1,
                  value = 0.5),
      # Input Table
      # Text instructions
      HTML(paste("Enter a value between 1 and", n_total)),
      
      # Numeric input for sample size
      numericInput(inputId = "n",
                   label = "Sample size:",
                   min = 1, max = n_total,
                   value = 30,
                   step = 1),
      
      # Select Studio
      selectInput(inputId = "studio",
                  label = "Select studio",
                  choices = all_studios,
                  selected = "20th Century Fox",
                  multiple = TRUE,
                  selectize = TRUE)
      
    ),
    
    # Outputs
    mainPanel(
      plotOutput(outputId = "scatterplot"),
      plotOutput(outputId = "densityplot", height = 200),
      DT::dataTableOutput(outputId = "moviestable")
    )
  )
)


# Define server function required to create the scatterplot
server <- function(input, output) {
  
  # Create scatterplot object the plotOutput function is expecting
  output$scatterplot <- renderPlot({
    ggplot(data = movies, aes_string(x = input$x, y = input$y, color = input$z)) +
      geom_point(alpha = input$alpha)
  })
  
  # Create desityplot
  output$densityplot <- renderPlot({
    ggplot(data = movies, aes_string(x = input$x)) +
      geom_density()
  })
  
  # Create data table
  output$moviestable <- DT::renderDataTable({
    # req(input$n)
    req(input$studio)
    movies_sample <- movies %>% 
      # sample_n(input$n) %>%
      filter(studio %in% input$studio) %>% 
      select(title:studio) 
    DT::datatable(data = movies_sample,
                  options = list(pageLength = 5),
                  rownames = FALSE)
  })
}

# Create a Shiny app object
shinyApp(ui = ui, server = server)
