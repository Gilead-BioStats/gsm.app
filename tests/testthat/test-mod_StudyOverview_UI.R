test_that("mod_StudyOverview_UI creates the expected UI", {
  test_result <- mod_StudyOverview_UI(
    "testID",
    sample_dfResults,
    rlang::set_names(sample_dfMetrics$MetricID, sample_dfMetrics$Metric)
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
