knitAllRmd <- function (folder = c('blog', 'pages'), target = paste0('app/html/',folder), recompile = TRUE) {
  library(stringr)
  library(rmarkdown)
  library(dplyr)
  
  # Where blog posts are stored, in .rmd format.
  path <- file.path(getwd(), folder)
  target_path <- file.path(getwd(), target)
  
  # Find the *.rmd-marked blog posts to compile. If recompile == FALSE,
  # assume that any *.md files found in the same directory are the compiled
  # results of existing blgo posts and don't recompile these.
  blogPosts <- list.files(path, pattern = "[\\.]rmd$", ignore.case = TRUE, full.names = TRUE)
  compiledPosts <- list.files(target_path, pattern = "[\\.]html$", ignore.case = TRUE, full.names = TRUE)
  
  if (recompile == FALSE) {
    blogPosts <- blogPosts[
      !
        ( blogPosts %>% str_replace(ignore.case(".rmd$"), "") %>% str_replace_all(getwd(), "") ) %in% 
        ( compiledPosts %>% str_replace(ignore.case(".html$"), "") %>% str_replace_all(paste0(getwd(),"/app/html"), "") )
      ]
  } else {
    # Remove all HTML files before recompiling
    file.remove(compiledPosts)
  }
  
  # Render blog posts into HTML. Note that this makes them ready for deployment
  # via Shiny, so it's probably a bad idea to view these standalone in your
  # browser. But then again, you probably already knew that if you're looking
  # at this code.
  path = getwd()
  for (blogPost in blogPosts) {
    output_dir <- file.path(getwd(), target[folder %in% basename(dirname(blogPost))])
    render(
      input = blogPost,
      output_format = html_document(
        preserve_yaml = FALSE,
        template = file.path(path, "www/templates/default.html"),
        self_contained = FALSE,
        lib_dir = file.path(path, "app/html/pages/js")
      ),
      output_dir = output_dir
    )
  }
}
