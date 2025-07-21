expect_official_screenshot <- function(app, ...) {
  if (isTRUE(as.logical(Sys.getenv("SHINYTEST2_TEST_SCREENSHOT")))) {
    app$expect_screenshot(...)
  } else {
    succeed("Skipping screenshot test on this platform.")
  }
}
