# install.packages("shiny")
# install.packages("shinydashboard")

library(shiny)
library(shinydashboard)

# Define Header ----
header <- dashboardHeader(
  title = "My dashboard",
  
  # Messages menu
  dropdownMenu(type = "messages",
                messageItem("Sales Dept",
                            message = "Sales are steady this month."
                            ),
                messageItem("New User",
                            message = "How do I register?",
                            icon = icon("question"),
                            time = "13:27"
                            ),
                messageItem("Support",
                            message = "The new server is ready.",
                            icon = icon("life-ring"),
                            time = "2019-04-22")
                ),
  
  # Notifications menu
  dropdownMenu(type = "notifications",
               notificationItem(
                 text = "5 new users today",
                 icon("users")
               ),
               notificationItem(
                 text = "12 items delivered",
                 icon("truck"),
                 status = "success"
               ),
               notificationItem(
                 text = "Server load at 86%",
                 icon = icon("exclamation-triangle"),
                 status = "warning"
               )
  ),
  
  # Task menus
  dropdownMenu(type = "tasks", badgeStatus = "success",
               taskItem(value = 90, color = "green",
                        "Documentation"),
               taskItem(value = 17, color = "aqua",
                        "Project X"),
               taskItem(value = 75, color = "yellow",
                        "Server deployment"),
               taskItem(value = 80, color = "red",
                        "Overall project")
               ),
  
  # Dynamic content
  dropdownMenuOutput("messageMenu")
  
  # Disabling the Header
  # disable = TRUE  
)

# Define Sidebar ----
sidebar <- dashboardSidebar()

# Define Body ----
body <- dashboardBody()


# Define UI ----
ui <- dashboardPage(header, sidebar, body)


# Define server ----
server <- function(input, output) {
  messageData <- data.frame("from" = "teste",
                            "message" = "Testando")
  
  output$messageMenu <- renderMenu({
    msgs <- apply(messageData, 1, function(row) {
      messageItem(from = row[["from"]], message = row[["message"]])
    })
    
    dropdownMenu(type = "messages", .list = msgs)
  })
  
  ?renderMenu
  
}



# Run the App ----
shinyApp(ui, server)