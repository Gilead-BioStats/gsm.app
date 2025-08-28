# Standard skips ----

skip_if_not_br <- function() {
  maybe_skip_br_tests()
  skip_on_windows_ci()
  skip_if_not_installed("shinytest2")
  skip_if_not_installed("rvest")
  skip_on_cran()
}

maybe_skip_br_tests <- function() {
  # I'm still including this, but I'd like to TRY to run them all everywhere.
  skip_if_not(
    # as.logical(Sys.getenv("RUN_BR_TESTS", "false")),
    TRUE,
    # FALSE,
    "BR tests are super slow"
  )
}

skip_on_windows_ci <- function() {
  # Ironically, the tests time out on the Windows runner on GitHub, even
  # though they run fine on my local Windows machine.
  skip_if(
    Sys.info()[["sysname"]] == "Windows" &&
      isTRUE(as.logical(Sys.getenv("CI", "false"))),
    "BR tests time out on GitHub Windows runner"
  )
}

# App Driver ----

br_app <- function(app_dir, name, width = 1300, ...) {
  shinytest2::AppDriver$new(
    app_dir = test_path("apps", app_dir),
    variant = "br",
    name = name,
    width = width,
    height = 800,
    ...
  )
}

# Screenshots ----

expect_official_screenshot <- function(app, name, ...) {
  if (isTRUE(as.logical(Sys.getenv("SHINYTEST2_TEST_SCREENSHOT")))) {
    name <- paste(name, collapse = "-")
    app$expect_screenshot(name = name, ...)
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

# Other general ----

select_tab <- function(tab_name) {
  glue::glue('div.tab-pane[data-value="{tab_name}"]')
}
