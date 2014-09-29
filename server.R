
# This is the server part of the base application.
# This basically works as a backend, but is also used to dynamically generate content.

library(shiny)


shinyServer(function (input, output, session) {
  
  # Function to fetch URL data
  interpretUrl <- reactive({
    # For now, simply return the query part of the URL in a parsed state
    query <- parseQueryString(session$clientData$url_search)
    
    query
  })
  
  
  # Put server functions here
  
  ## Blog post generation ----
  output$blog <- renderUI({
    print(getwd())
    files <- Filter(function (x) str_detect(x, "[\\.]html$"), list.files(file.path(getwd(), 'blog'), full.names = TRUE))
    print(files)
    
    blog <- lapply(files, function (p) {
      # browser()
      tagList(column(
        8, offset = 2,
        #blogUI <- lapply(files, function (p) {
        includeHTML(p),
        hr()
      ))
    })
    
    return(blog)
  })
})
