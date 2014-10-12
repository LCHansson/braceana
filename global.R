
# This is the pre-run script.
# All code put in here is run once, at startup.


## Website variables ----
# These are content parameters for your website.
web_title = 'Braceana'
footer_text = "Generated with <a href='https://github.com/lchansson/braceana'>Braceana</a>, a markdown-based CMS written by <a href='https://github.com/lchansson'>LCHansson</a>, 2014. Built using <a href='http://shiny.rstudio.com'>Shiny</a>. Framework licensed under the <a href='http://www.gnu.org/licenses/agpl-3.0.html'>AGPL v3</a>."
blog_name = 'Blogg'

blog_path = 'blog'
pages_path = 'pages'


##
## Don't change any code below this line if you don't know what you're doing. ##
##

## Set run options ----
options("shiny.launch.browser" = TRUE)
options(shiny.reactlog = FALSE)

## Include custom widgets and libraries ----
files <- c('app/functions', 'app/widgets')

for (sourceFile in list.files(file.path(getwd(), files), full.names = TRUE)
     source(sourceFile)

## Functions to run at startup ----
knitAllRmd(folder = c(blog_path, pages_path), recompile = TRUE)
