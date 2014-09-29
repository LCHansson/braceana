
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

navbarPage(
  title = "AppTitle",
  responsive = TRUE, collapsable = TRUE,
  
  
  ## <BODY> ----
  # Embed personalised CSS. Use 'includeCSS()' since 'theme ='
  # or 'tags$link()' both kill the embedded bootstrap.css connection.
    
  # Header and footer code
  footer = tagList(
    column(10, offset = 1, p(tags$small("(C) Love Hansson, 2014")))
  ),
  
  ## NAVBAR ----
  tabPanel(
    'Start',
    # Application title
    h1('AppTitle')
  ),
  ## EXAMPLE BLOG POST GENERATION
  tabPanel(
    'Blog',
    uiOutput('blog')
  ),
  
  
  ## <HEAD> ----
  # Yes; this goes AFTER the body definition. This is due to a bug in navbarPage().
  singleton(tags$head(
      HTML("<link href='http://fonts.googleapis.com/css?family=Open+Sans|Lato:400,300' rel='stylesheet' type='text/css'>")
    )),
  singleton(includeCSS("www/lchansson.css"))
)
