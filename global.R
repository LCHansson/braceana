
# This is the pre-run script.
# All code put in here is run once, at startup.


# Website variables
web_title = 'Utvecklingsrådet'
footer_text = "Generated with <a href='https://github.com/lchansson/braceana'>Braceana</a>, a markdown-based CMS written by <a href='https://github.com/lchansson'>Love Hansson</a>, 2014. Built using <a href='http://shiny.rstudio.com'>Shiny</a>. Framework licensed under the <a href='http://www.gnu.org/licenses/agpl-3.0.html'>AGPL v3</a>."
blog_name = 'Blogg'

blog_path = 'blog'
pages_path = 'pages'

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
knitAllRmd(folder = c(blog_path, pages_path), recompile = TRUE)
