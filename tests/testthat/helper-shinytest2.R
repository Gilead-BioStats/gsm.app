# I do this in a helper so that it loads when testing locally.

if (rlang::is_installed("shinytest2", version = "0.4.1")) {
  library(shinytest2)
  options(chromote.headless = "new")
}

# Standard skips and checks ----

on_ci <- function() {
  isTRUE(as.logical(Sys.getenv("CI", "false")))
}

skip_if_not_qualifying <- function() {
  if (testing_entire_package()) {
    skip("Not qualifying.")
  }
  skip_on_cran()
  skip_on_covr()
}

testing_entire_package <- function() {
  !testing_qc() && !testing_active_file()
}

testing_active_file <- function() {
  any(
    grepl("test_active_file", as.character(sys.calls()))
  )
}

testing_qc <- function() {
  isTRUE(as.logical(Sys.getenv("TESTTHAT_IS_QCING", "false")))
}

# App Driver ----

CompileVariantDir <- function() {
  paste("br", shinytest2::platform_variant(), sep = "-")
}

br_app <- function(app_dir, name, width = 1300, ...) {
  shinytest2::AppDriver$new(
    app_dir = test_path("apps", app_dir),
    variant = CompileVariantDir(),
    name = name,
    width = width,
    height = 800,
    ...
  )
}

# Other ----

test_that_br_app_title <- function(
  app_dir,
  snapshot_name,
  expected_title,
  screenshot_name
) {
  app <- br_app(
    app_dir = app_dir,
    name = snapshot_name
  )
  app$wait_for_idle()
  expect_equal(app$get_text("title"), expected_title)
  expect_official_screenshot(
    app,
    name = screenshot_name,
    selector = ".navbar"
  )
  app$stop()
}
