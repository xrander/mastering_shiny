library(shiny)

ui <- fluidPage(
  selectInput(
    inputId = "dataset",
    label = "Dataset",
    choices = ls("package:datasets")
  ),
  verbatimTextOutput("summary"),
  tableOutput(outputId = "summary_table")
)

server <- function(input, output, session) {
  dataset <- reactive({
    get(input$dataset, "package:datasets")
  })
 output$summary <- renderPrint({
   summary(dataset())
 }) 
 
 output$summary_table <- renderTable({
   dataset()
 })
}

shinyApp(ui, server)