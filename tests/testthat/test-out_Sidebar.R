test_that("out_Sidebar generates the expected UI", {
  chrMetrics <- rlang::set_names(
    sample_dfMetrics$MetricID,
    sample_dfMetrics$Metric
  )
  test_result <- out_Sidebar(sample_dfGroups, sample_dfResults, chrMetrics, 10L)
  expect_s3_class(test_result, c("bslib_sidebar", "sidebar", "list"))
  expect_cleaned_html({
    htmltools::as.tags(test_result$children)
  })
})
