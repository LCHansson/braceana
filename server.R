
# This is the server part of Braceana.
# 
# server.R basically works as a backend, but is also used to dynamically generate
# content. To edit the look and feel of the application, edit the section labeled
# CONTENT GENERATION below.

library(shiny)
library(dplyr)
library(stringr)

shinyServer(function (input, output, session) {
  
  ## Internals ----
  # Function to fetch URL data
  interpretUrl <- reactive({
    # For now, simply return the query part of the URL in a parsed state
    query <- parseQueryString(session$clientData$url_search)
    
    query
  })
  
  
  ## CONTENT GENERATION ----
  output$navbar <- renderUI({
    pages_files <- Filter(
      function (x) str_detect(x, "[\\.]html$"),
      list.files(file.path(getwd(), 'pages'),
                 full.names = TRUE)
    )
    blog_present <- ( length(list.files(blog_path)) > 0 )
    print(blog_present)
    
    ## Basic page metaelements ----
    barebone_page <- tagList(
      title = web_title,
      collapsable = TRUE, responsive = TRUE,
      footer = tagList(
        column(8, offset = 2, p(tags$small(HTML(footer_text)), class = "footertext"))
      )
    )
    
    ## Pages ----
    # Generate a list of tabPanel() each with the contents of one page
    # (in alphabetical order by filename)
    pages <- lapply(pages_files, function (name) {
      
      # In future, we might want a cleverer strategy for naming
      # and ordering pages, but for now we'll just assume the name of the
      # page source file has a camel cased name in it somewhere.
      nameParts <- str_split(name, "[\\/]")[[1]]
      properName <- nameParts[length(nameParts)] %>%
        str_replace("[\\.]html$", "") %>%
        str_replace("[[:punct:][:digit:]]*", "") %>%
        # I'm especially proud of this one: Insert a space before every
        # upper-case letter that isn't at the beginning of the string.
        str_replace_all(perl("(?<!^)(?=[A-Z])"), " ")
      
      # Create the tab panel, including the contents of the page and the name
      tabPanel(
        properName,
        column(
          8, offset = 2,
          includeHTML(name),
          br(), br(), hr()
        )
      )
    })
    
    ## Blog posts ----
    
    if (blog_present) {
      blog_posts <- list(
        tabPanel(
          'Blog',
          uiOutput('blog')
        )
      )
    } else {
      blog_posts <- list()
    }
    
    ## <HEAD> ----
    header <- list(
      # Yes; this goes AFTER the body definition. This is due to a bug in navbarPage().
      singleton(tags$head(
        HTML("<link href='http://fonts.googleapis.com/css?family=Open+Sans|Lato:400,300' rel='stylesheet' type='text/css'>")
      )),
      singleton(includeCSS("app/www/lchansson.css"))
    )
    
    site <- pages %>% append(blog_posts) %>% append(header)
      
    # Create a unified list with all tab elements and pass them to navbarPage()
    tablist <- barebone_page %>% append(site)
    do.call(navbarPage, tablist)
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
        br(), br(), hr()
      ))
    })
    
    blog
  })
})
