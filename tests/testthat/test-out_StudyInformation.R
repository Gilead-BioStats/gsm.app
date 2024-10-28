test_that("out_StudyInformation shows study info", {
  test_result <- out_StudyInformation(sample_dfGroups, sample_dfResults)
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html(test_result)
})
