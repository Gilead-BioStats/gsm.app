test_that("out_Sidebar generates the expected UI", {
  lStudy <- make_lStudy(sample_dfGroups, sample_dfResults)
  chrMetrics <- rlang::set_names(sample_dfMetrics$MetricID, sample_dfMetrics$Metric)
  chrSites <- head(sort(unique(sample_dfGroups$GroupID[sample_dfGroups$GroupLevel == "Site"])))
  test_result <- out_Sidebar(lStudy, chrMetrics, chrSites, 10L)
  expect_s3_class(test_result, c("bslib_sidebar", "sidebar", "list"))
  expect_cleaned_html({
    htmltools::as.tags(test_result$children)
  })
})
