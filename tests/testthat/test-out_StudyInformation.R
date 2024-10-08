test_that("out_StudyInformation shows study info", {
  lStudy <- make_lStudy(sample_dfGroups, sample_dfResults)
  test_result <- out_StudyInformation(lStudy)
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html(test_result)
})
