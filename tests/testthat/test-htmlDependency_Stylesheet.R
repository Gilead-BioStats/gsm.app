test_that("htmlDependency_Stylesheet attaches a stylesheet", {
  test_result <- htmlDependency_Stylesheet("defaultStyles.css")
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
