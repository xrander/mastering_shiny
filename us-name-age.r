library(shiny)

ui <- fluidPage(
  title = "Name and Age",
  textInput("name", label = "What's your name"),
  textOutput("greeting"),
  numericInput(inputId = "age", label = "Age in years", value = 0),
  textOutput("us_age")
)

server <- function(input, output, session) {
  output$greeting <- renderText({
    paste0("Hello ", input$name)
  })
  output$us_age <- renderText(
    paste0("You are ", input$age, " years old")
  )
}

shinyApp(ui, server)