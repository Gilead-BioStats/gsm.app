# Standard skips ----

skip_if_not_br <- function() {
  probably_skip_br_tests()
  skip_if_not_installed("shinytest2")
  skip_if_not_installed("rvest")
  skip_on_cran()
}

probably_skip_br_tests <- function() {
  # I'm still including this, but I'd like to TRY to run them all everywhere.
  skip_if_not(
    # as.logical(Sys.getenv("RUN_BR_TESTS", "false")),
    TRUE,
    "BR tests are super slow"
  )
}

# Screenshots ----

expect_official_screenshot <- function(app, ...) {
  if (isTRUE(as.logical(Sys.getenv("SHINYTEST2_TEST_SCREENSHOT")))) {
    app$expect_screenshot(...)
  } else {
    succeed("Skipping screenshot test on this platform.")
  }
}

# Other expectations ----

expect_css_class <- function(html, selector, css_class) {
  css_classes_raw <- rvest::read_html(html) %>%
    rvest::html_element(selector) %>%
    rvest::html_attr("class")
  if (!is.na(css_classes_raw) && nchar(css_classes_raw)) {
    css_classes <- stringr::str_split_1(css_classes_raw, " ")
    expect_contains(css_classes, css_class)
  } else {
    fail("No classes found")
  }
}
