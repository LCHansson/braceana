# Run options
options("shiny.launch.browser" = TRUE)
options(shiny.reactlog = TRUE)

# Source functions
sourceFiles <- list.files(file.path(getwd(), 'R'), full.names = TRUE)
for (sourceFile in sourceFiles)
     source(sourceFile)

widgets <- list.files(file.path(getwd(), 'widgets'), full.names = TRUE)
for (widget in widgets)
  source(widget)


# Functions to run before startup
knitAllRmd(recompile = TRUE)
