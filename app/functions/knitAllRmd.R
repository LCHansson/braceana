knitAllRmd <- function (folder = 'blog', recompile = TRUE) {
  library(stringr)
  library(rmarkdown)
  
  # Where blog posts are stored, in .rdm format.
  path <- file.path(getwd(), 'app', folder)
  
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
  
  # Render blog posts into HTML. Note that this makes them ready for deployment
  # via Shiny, so it's probably a bad idea to view these standalone in your
  # browser. But then again, you probably already knew that if you're looking
  # at this code.
  for (blogPost in blogPosts) {
    render(
      input = blogPost,
      output_format = html_document(
        preserve_yaml = TRUE,
        template = file.path(getwd(), "www/templates/default.html")
      )
    )
  }
}
