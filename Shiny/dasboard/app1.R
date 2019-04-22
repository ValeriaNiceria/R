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
sidebar <- dashboardSidebar(
  # Logout panel
  # Custom CSS
  tags$head(tags$style(HTML('.shiny-server-account { display: none; }'))),
  uiOutput("userpanel"),
  
  # Sidebar inputs
  sidebarSearchForm(textId = "search_text", buttonId = "search_button",
                    label = "Search..."),
  # Menu
  sidebarMenu(id = "sidebar",
    menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
    menuItem("Widgets", icon = icon("th"), tabName = "widgets",
             badgeLabel = "new", badgeColor = "green"),
    menuItem("tabBox", icon = icon("table"), tabName = "tabBox"),
    menuItem("infoBox", icon = icon("info"), tabName = "infoBox"),
    menuItem("Source code", icon = icon("file-code-o"), href = "https://github.com/rstudio/shinydashboard/")
  ),
  
  # Dinamic content
  sidebarMenuOutput("menu")
)


# Define Dashboard Page ----
dashboardPage <- fluidRow(
  box(title = "Histogram", 
      status = "primary", 
      solidHeader = TRUE,
      collapsible = TRUE,
      plotOutput("plot1", height = 250)),
  
  box(title = "Inputs",
      status = "warning",
      solidHeader = TRUE,
      collapsible = TRUE,
      "Box content here", br(), "More box content",
      sliderInput("slider", "Slider input:", 1, 100, 50),
      textInput("text", "Text input:")
  )
)

# Define tabBoxPage ----
tabBoxPageH <- fluidRow(
  tabBox(
    title = "Fist tabBox",
    id = "tabset1", height = "250px",
    tabPanel("Tab1", "First tab content"),
    tabPanel("Tab2", "Tab content 2")
  ),
  tabBox(
    side = "right", height = "250px",
    selected = "Tab3",
    tabPanel("Tab1", "Tab content 1"),
    tabPanel("tab2", "Tab content 2"),
    tabPanel("tab3", "Tab content 3")
  )
)

tabBoxPageF <- fluidRow(
  tabBox(
    title = tagList(shiny::icon("gear"), "tabBox status"),
    tabPanel("tab1",
             "Currently selected tab from first box:",
             verbatimTextOutput("tabset1Selected")),
    tabPanel("Tab2", "Tab Content 2")
  )
)

# Define infoBoxPage ----
infoBoxPage <- fluidRow(
  infoBox("New Orders", 10 * 2, icon = icon("credit-card")),
  infoBoxOutput("progressBox"),
  infoBoxOutput("approvalBox")
)



# Define Body ----
body <- dashboardBody(
  tabItems(
    tabItem(tabName = "dashboard", dashboardPage),
    tabItem(tabName = "widgets", h2("Widgets tab content")),
    tabItem(tabName = "tabBox", tabBoxPageH, tabBoxPageF),
    tabItem(tabName = "infoBox", infoBoxPage)
  )
)



# Define UI ----
ui <- dashboardPage(
  # Skins - back - blue - purple - green - red - yellow
  skin = "blue",
  # Header
  header, 
  # Sidebar
  sidebar, 
  # Body
  body
)




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
  
  output$menu <- renderMenu({
    sidebarMenu(
      menuItem("Menu item", icon = icon("calendar"))
    )
  })
  
  # Plot
  set.seed(122)
  histdata <- rnorm(500)
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
  
  
  # tabBox
  output$tabset1Selected <- renderText({
    input$tabset1
  })
  
  
  # infoBox
  output$progressBox <- renderInfoBox({
    infoBox(
      "progress",
      paste0(25 + 10, "%"), icon = icon("list"),
      color = "purple", fill = TRUE
    )
  })
  
  output$approvalBox <- renderInfoBox({
    infoBox(
      "approval", "80%", icon = icon("thumbs-up", lib = "glyphicon"),
      color = "yellow", fill = TRUE
    )
  })
  
  
  # Logout panel
  output$userpanel <- renderUI({
  })
  
}



# Run the App ----
shinyApp(ui, server)