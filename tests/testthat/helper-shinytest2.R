# Set up shinytest2 tests, but only if specifically activated.
#
# shinytest2 requires that the package actually be *installed* for testing, not
# just loaded. This slows down testing significantly.

if (getOption("shinytest2.test", FALSE)) {
  library(shinytest2)
}

skip_if_not_shinytesting <- function() {
  if (!getOption("shinytest2.test", FALSE)) {
    skip(
      "End-to-end tests. Run options(shinytest2.test = TRUE) to activate."
    )
  }
}

