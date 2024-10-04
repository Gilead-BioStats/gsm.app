test_that("out_DetectCardClicks sets up JavaScript", {
  test_result <- out_DetectCardClicks("a", "b")
  expect_s3_class(test_result, "shiny.tag.list")
  expect_s3_class(test_result[[1]], "html_dependency")
  expect_s3_class(test_result[[2]], "shiny.tag")
  expect_cleaned_html(test_result)
})
