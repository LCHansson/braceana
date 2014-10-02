
# This is the pre-run script.
# All code put in here is run once, at startup.


# Website variables
web_title = 'Utvecklingsrådet'
footer_text = "Generated with Braceana, a markdown-based CMS written by Love Hansson, 2014. Built using <a href='http://shiny.rstudio.com'>Shiny</a>. Framework licensed under the AGPL."

# Run options
options("shiny.launch.browser" = TRUE)
options(shiny.reactlog = TRUE)

# Source functions
sourceFiles <- list.files(file.path(getwd(), 'app/functions'), full.names = TRUE)
for (sourceFile in sourceFiles)
     source(sourceFile)

widgets <- list.files(file.path(getwd(), 'app/widgets'), full.names = TRUE)
for (widget in widgets)
  source(widget)


# Functions to run
knitAllRmd(recompile = TRUE)
