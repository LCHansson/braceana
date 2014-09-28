
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output, session) {
  
  # Function to fetch URL data
  interpretUrl <- reactive({
    # For now, simply return the query part of the URL in a parsed state
    query <- parseQueryString(session$clientData$url_search)
    
    query
  })
  
  
  # Put server functions here
  
})
