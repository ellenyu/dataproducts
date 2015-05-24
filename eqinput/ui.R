library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("State of Oklahoma Earthquake Daily Rate"),
  sidebarPanel(
    dateInput("date", "Start Date:"),
    numericInput('id1', 'Duration in Days max(3650)', value= 3, min = 0, max = 3650, step = 1),
  
    submitButton("Submit")
  ),
  mainPanel(
	plotOutput('newHist'),
	h4('Mean daily rate: '), verbatimTextOutput("medrate")
  )
))
