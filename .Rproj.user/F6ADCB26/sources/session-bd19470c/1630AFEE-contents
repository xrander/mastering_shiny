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
 output$summary <- renderPrint({
   dataset <- get(input$dataset, "package:datasets")
   summary(dataset)
 }) 
 
 output$summary_table <- renderTable({
   dataset <- get(input$dataset, "package:datasets")
   dataset
 })
}

shinyApp(ui, server)


