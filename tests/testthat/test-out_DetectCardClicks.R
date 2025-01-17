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

test_that("out_DetectCardClicks sets up JavaScript", {
  test_result <- out_DetectCardClicks("a", "b")
  expect_s3_class(test_result, "shiny.tag.list")
  expect_s3_class(test_result[[1]], "html_dependency")
  expect_s3_class(test_result[[2]], "shiny.tag")
  expect_cleaned_html(test_result)
})
