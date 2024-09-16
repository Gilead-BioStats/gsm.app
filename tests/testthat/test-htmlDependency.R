test_that("htmlDependency_Stylesheet attaches the stylesheet", {
  test_result <- htmlDependency_Stylesheet()
  expect_s3_class(test_result, "html_dependency")
  expected_result <- list(
    name = "Stylesheet",
    version = "1.0.0",
    src = list(file = "www"),
    meta = NULL,
    script = NULL,
    stylesheet = "styles.css",
    head = NULL,
    attachment = NULL,
    package = "gsm.app",
    all_files = TRUE
  )
  expect_identical(unclass(test_result), expected_result)
})

test_that("htmlDependency_HighlightTableRow attaches the expected JS", {
  test_result <- htmlDependency_HighlightTableRow()
  expect_s3_class(test_result, "html_dependency")
  expected_result <- list(
    name = "HighlightTableRow",
    version = "1.0.0",
    src = list(file = "js"),
    meta = NULL,
    script = "highlightTableRow.js",
    stylesheet = NULL,
    head = NULL,
    attachment = NULL,
    package = "gsm.app",
    all_files = TRUE
  )
  expect_identical(unclass(test_result), expected_result)
})

test_that("htmlDependency_TableClick attaches the expected JS", {
  test_result <- htmlDependency_TableClick()
  expect_s3_class(test_result, "html_dependency")
  expected_result <- list(
    name = "TableClick",
    version = "1.0.0",
    src = list(file = "js"),
    meta = NULL,
    script = "tableClick.js",
    stylesheet = NULL,
    head = NULL,
    attachment = NULL,
    package = "gsm.app",
    all_files = TRUE
  )
  expect_identical(unclass(test_result), expected_result)
})
