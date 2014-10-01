
# This is the user interface part of the base application.
# This can be extended, either by adding UI code here (or calling UI-generating
# code in server.R) - or by adding widgets to the 'widgets' folder and embedding
# them here.

library(shiny)

# fluidPage(
#   title = "AppTitle",
#   responsive = TRUE, collapsable = TRUE,
#   
#   
#   ## NAVBAR ----
#   uiOutput('navbar'),
#   
#   ## <BODY> ----
#   # Embed personalised CSS. Use 'includeCSS()' since 'theme ='
#   # or 'tags$link()' both kill the embedded bootstrap.css connection.
#     
#   # Header and footer code
#   footer = tagList(
#     column(10, offset = 1, p(tags$small("(C) Love Hansson, 2014")))
#   ),
#   
#   
#   ## <HEAD> ----
#   # Yes; this goes AFTER the body definition. This is due to a bug in navbarPage().
#   singleton(tags$head(
#       HTML("<link href='http://fonts.googleapis.com/css?family=Open+Sans|Lato:400,300' rel='stylesheet' type='text/css'>")
#     )),
#   singleton(includeCSS("app/www/lchansson.css"))
# )

uiOutput('navbar')