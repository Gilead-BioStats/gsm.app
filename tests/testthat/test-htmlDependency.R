test_that("htmlDependency_Default_Stylesheet attaches the stylesheet", {
  test_result <- htmlDependency_Default_Stylesheet()
  expect_s3_class(test_result, "html_dependency")
  expected_result <- list(
    name = "defaultStyles",
    version = "1.0.0",
    src = list(file = "css"),
    meta = NULL,
    script = NULL,
    stylesheet = "defaultStyles.css",
    head = NULL,
    attachment = NULL,
    package = "gsm.app",
    all_files = TRUE
  )
  expect_identical(unclass(test_result), expected_result)
})

test_that("htmlDependency_DetectCardClicks attaches the expected JS", {
  test_result <- htmlDependency_DetectCardClicks()
  expect_s3_class(test_result, "html_dependency")
  expected_result <- list(
    name = "DetectCardClicks",
    version = "0.0.1",
    src = list(file = "js"),
    meta = NULL,
    script = "detectCardClicks.js",
    stylesheet = NULL,
    head = NULL,
    attachment = NULL,
    package = "gsm.app",
    all_files = TRUE
  )
  expect_identical(unclass(test_result), expected_result)
})
