
# This is the server part of the base application.
# This basically works as a backend, but is also used to dynamically generate content.

library(shiny)
library(dplyr)


shinyServer(function (input, output, session) {
  
  ## Internals ----
  # Function to fetch URL data
  interpretUrl <- reactive({
    # For now, simply return the query part of the URL in a parsed state
    query <- parseQueryString(session$clientData$url_search)
    
    query
  })
  
  output$navbar <- renderUI({
    pages_files <- Filter(function (x) str_detect(x, "[\\.]html$"), list.files(file.path(getwd(), 'pages'), full.names = TRUE))
    print(pages_files)

    barebone_page <- tagList(
      title = "AppTitle",
      collapsable = TRUE, responsive = TRUE,
      tabPanel(
        'Start',
        # Application title
        h1('App Title')
      ),
      
      tabPanel(
        'Blog',
        uiOutput('blog')
      )
    )
    
    ## EXAMPLE PAGES GENERATION ----
    pages <- lapply(pages_files, function (name) {
      nameParts <- str_split(name, "[\\/]")[[1]]
      properName <- nameParts[length(nameParts)] %>%
        str_replace("[\\.]html$", "") %>%
        str_replace("[[:punct:][:digit:]]*", "") %>%
        str_replace_all(perl("(?<!^)(?=[A-Z])"), " ")
      
      tabPanel(
        properName,
        column(
          8, offset = 2,
          includeHTML(name),
          hr()
        )
      )
    })
    
      
    ## EXAMPLE BLOG POST GENERATION ----  
    #     blog_posts <- tabPanel(
    #       'Blog',
    #       uiOutput('blog')
    #     )
    
    tablist <- barebone_page %>% append(pages)
    
    do.call(navbarPage, tablist)
  })
  
  output$pages <- renderUI({
    files <- Filter(function (x) str_detect(x, "[\\.]html$"), list.files(file.path(getwd(), 'pages'), full.names = TRUE))
    print(files)
    
    pages <- lapply(files, function (p) {
      # browser()
      tabPanel(column(
        8, offset = 2,
        #blogUI <- lapply(files, function (p) {
        includeHTML(p),
        hr()
      ))
    })
  })
  
  
  
  ## Blog post generation ----
  output$blog <- renderUI({
    files <- Filter(function (x) str_detect(x, "[\\.]html$"), list.files(file.path(getwd(), 'blog'), full.names = TRUE))
    
    blog <- lapply(files, function (p) {
      # browser()
      tagList(column(
        8, offset = 2,
        #blogUI <- lapply(files, function (p) {
        includeHTML(p),
        hr()
      ))
    })
    
    return (blog)
  })
})
