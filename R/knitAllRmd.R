knitAllRmd <- function (folder = 'blog', recompile = FALSE) {
  library(stringr)
  
  path <- file.path(getwd(), folder)
  
  oldDir <- setwd(path)
  
  # Find the *.rmd-marked blog posts to compile. If recompile == FALSE,
  # assume that any *.md files found in the same directory are the compiled
  # results of existing blgo posts and don't recompile these.
  blogPosts <- list.files(path, pattern = "[\\.]rmd$", ignore.case = TRUE)
  if (recompile == FALSE) {
    compiledPosts <- list.files(path, pattern = "[\\.]md$", ignore.case = TRUE)
    blogPosts <- blogPosts[
      !str_replace(blogPosts, ignore.case(".rmd"), "") %in% 
        str_replace(compiledPosts, ignore.case(".md"), "")
      ]
  }
  
  for (blogPost in blogPosts) {
    knit(input = blogPost, output = str_replace(blogPost, ignore.case(".rmd"), ".md"))
  }
  
  setwd(oldDir)
}
