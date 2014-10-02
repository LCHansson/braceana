# Example widget. This just displays a plot and a numeric selector.

exampleWidget <- function () {
  require(shiny)
  
  app <- shinyApp(
    ui = fluidPage(
      numericInput("n", "n", 5),
      plotOutput("plot")
    ),
    server = function (input, output) {
      output$plot <- renderPlot( plot(head(cars, input$n)) )
    }
  )
  
  app
}
