Braceana
========

Braceana is an attempt to create a dirt simple publishing platform in R/shiny. It is licensed under the AGPL version 3 (see enclosed LICENSE).

Are you a web developer, looking for a checp-and-dirty CMS for quick publishing?

Are you looking for lightning fast responsive design, easily managed SEO or an awesome plugin system using your favorite scripting language?

Are you tired of bloated CMSes capable of doing everything, but being good at nothing?

Then you should probably look somewhere else.

However, if you're an R developer, analyst, or statistical programmer who shares the love for easy publishing using Rmarkdown, Shiny widgets and ggvis graphics, then Braceana might actually be for you.

Braceana is a simple platform designed to take care of HTML rendering, theming, styling, and online publishing for you. Similar to Jekyll, it supports Pages and Blog posts and is easily extendable with Shiny widgets like ggvis graphics or RCharts plots.


### Features

- Supports pages and blog posts
- Auto-generated HTML from R Markdown files
- Run Shiny widgets and apps
- Easy theming with baseline CSS


### Requirements

Braceana requires `shiny` version >=0.10.1, `markdown` version >=0.7.4, and `rmarkdown` version >=0.3.3.

Braceana can be run locally using the 'shiny' package, or remotely using a Shiny hosting service like [Shinyapps.io](http://shinyapps.io).


### Using Braceana

Start by cloning the [Braceana repo](https://github.com/lchansson/braceana) from Github, or alternatively, downloading a zip file containing the repo.

Braceana is ready to use on the fly. Make sure you have the proper dependencies installed, and copy the files found in the `examples` folder to the `pages`and `blog` folders found in the root folder. Then fire up RStudio and press Run App, or do `setwd("my/path/to/braceana")` and run `shiny::runApp()`.

Braceana supports publishing to [ShinyApps.io](http://shinyapps.io). Simply make sure to follow the instructions for activating your account that can found on their web page, and deploy your app (including all pages and blog posts you might want to deploy) using `shinyapps::deployApp()`.

For an example, see [this website](http://lchansson.shinyapps.io/braceana).


### TODO

- Google Analytics support
- URL parser
- Theming
- Input validation for interactive apps (http://shiny.rstudio.com/articles/validation.html)


### Name

Braceana is named after [Phalaenopsis braceana](http://orchids.wikia.com/wiki/Phalaenopsis_braceana).
