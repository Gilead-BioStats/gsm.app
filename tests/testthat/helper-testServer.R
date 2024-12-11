# Silently load shiny or it'll make noise during tests.
suppressPackageStartupMessages(library(shiny))

testServer <- function(...) {
  suppressPackageStartupMessages(
    shiny::testServer(...)
  )
}
