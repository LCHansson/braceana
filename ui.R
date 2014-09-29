
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(
  # Embed personalised CSS. Use 'includeCSS()' since 'theme ='
  # or 'tags$link()' both botch the embedded bootstrap.css connection.
  includeCSS("www/lchansson.css"),
  
  tags$head(
    HTML("<link href='http://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>")
  ),
  
  # Application title
  h1('AppTitle'),
  
  # Put content here
  
  ## EXAMPLE BLOG POST GENERATION
  uiOutput('blog')
))
