library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Illustrating inputs"),
  sidebarPanel(
    numericInput('id1', 'Numeric input, labeled id1 max 10', 0, min = 0, max = 10, step = 1),
    dateInput("date", "Date:"),  
    actionButton("goButton", "Go!")
  ),
  mainPanel(
	plotOutput('newHist')
  )
))
