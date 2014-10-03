Braceana
========

Watch a demo of Braceana in action [here](http://lchansson.shinyapps.io/braceana)!

Braceana is an attempt to create a dirt simple publishing platform in R/shiny. It is licensed under the AGPL version 3 (see enclosed LICENSE).

Are you a web developer, looking for a quick-and-dirty CMS for quick publishing?

Are you looking for lightning fast responsive design, easily managed SEO, or an awesome plugin system based on your your favorite scripting language?

Are you tired of bloated CMSes capable of doing everything, but being good at nothing - especially not _your favorite web development thing_?

Then you should probably look somewhere else.

However, if you're an R developer, analyst, or statistical programmer who shares the love for easy publishing using Rmarkdown, Shiny widgets and ggvis graphics, then Braceana might actually be for you.

Braceana is a simple platform using the Rmarkdown (*.Rmd) as its sole publishing format. It is designed to take care of HTML rendering, theming, styling, and online publishing for you. Similar to Jekyll, it supports Pages and Blog posts and is easily extendable with Shiny widgets like ggvis graphics or RCharts plots. However, different from Jekyll, Braceana is not easily configurable and does not support any kinds of plugins. It does, however, come with custom CSS support so you can make it look any way you want to, if you want to.


### Features

- Supports pages and blog posts
- Auto-generated HTML from R Markdown files
- Run Shiny widgets and apps
- Bootstrap based CSS, with custom styling possible
- Full-time hackers familiar with Shiny can customise Braceana to their heart's content


### Requirements

Braceana requires `shiny` version >=0.10.1, `markdown` version >=0.7.4, and `rmarkdown` version >=0.3.3.

Braceana can be run locally using the 'shiny' package, or remotely using a Shiny hosting service like [Shinyapps.io](http://shinyapps.io).


### Using Braceana

Start by cloning the [Braceana repo](https://github.com/lchansson/braceana) from Github, or alternatively, downloading a zip file containing the repo.

Braceana is ready to use on the fly. Make sure you have the proper dependencies installed, and copy the files found in the `examples` folder to the `pages`and `blog` folders found in the root folder. Then fire up RStudio and press Run App, or do `setwd("my/path/to/braceana")` and run `shiny::runApp()`.

Braceana supports publishing to [ShinyApps.io](http://shinyapps.io). Simply make sure to follow the instructions for activating your account that can found on their web page, and deploy your app (including all pages and blog posts you might want to deploy) using `shinyapps::deployApp()`.

For an example, see [this website](http://lchansson.shinyapps.io/braceana).


### TODO

Braceana is still in early development. Please do not expect any response to any support request you might have (although asking nicely definitely helps)! The following is a short list of things that might turn up in future releases:

- Google Analytics support
- URL parser
- Better theming support
- Input validation for interactive apps (http://shiny.rstudio.com/articles/validation.html)
- Proper meta tag support (useful in blogs)


### Name

Braceana is named after [Phalaenopsis braceana](http://orchids.wikia.com/wiki/Phalaenopsis_braceana).
