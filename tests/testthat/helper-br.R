setup_br <- function() {
  probably_skip_br()
  skip_if_not_installed("shinytest2")
  skip_if_not_installed("rvest")
}
probably_skip_br <- function() {
  skip_if_not(
    as.logical(Sys.getenv("RUN_BR_TESTS", "false")),
    "BR tests are super slow"
  )
}
