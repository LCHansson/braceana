knitAllRmd <- function (folder = 'blog', recompile = FALSE) {
  library(stringr)
  library(rmarkdown)
  
  path <- file.path(getwd(), folder)
  
  #oldDir <- setwd(path)
  
  # Find the *.rmd-marked blog posts to compile. If recompile == FALSE,
  # assume that any *.md files found in the same directory are the compiled
  # results of existing blgo posts and don't recompile these.
  blogPosts <- list.files(path, pattern = "[\\.]rmd$", ignore.case = TRUE, full.names = TRUE)
  if (recompile == FALSE) {
    compiledPosts <- list.files(path, pattern = "[\\.]md$", ignore.case = TRUE, full.names = TRUE)
    blogPosts <- blogPosts[
      !str_replace(blogPosts, ignore.case(".rmd"), "") %in% 
        str_replace(compiledPosts, ignore.case(".md"), "")
      ]
  }
  
  #browser()
  
  for (blogPost in blogPosts) {
    render(
      input = blogPost,
      output_format = html_document(
        preserve_yaml = TRUE,
        template = file.path(getwd(), "www/templates/default.html")
      )
    )
  }
  
  #setwd(oldDir)
}
