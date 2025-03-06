test_that("out_MainTabs generates the expected UI", {
  dfResults <- head(sample_dfResults[sample_dfResults$GroupLevel == "Site", ])
  chrMetrics <- rlang::set_names(sample_dfMetrics$MetricID, sample_dfMetrics$Metric)
  chrDomains <- c(
    AE = "Adverse Events",
    DATACHG = "Data Changes",
    DATAENT = "Data Entry",
    ENROLL = "Enrollment",
    LB = "Lab",
    PD = "Protocol Deviations",
    QUERY = "Queries",
    STUDCOMP = "Study Completion",
    SUBJ = "Subject Metadata",
    SDRGCOMP = "Treatment Completion"
  )
  test_result <- out_MainTabs(chrDomains, dfResults, chrMetrics)
  expect_type(test_result, c("list"))
  expect_s3_class(test_result[[1]], c("shiny.tag"))
  expect_s3_class(test_result[[2]], c("shiny.tag"))
  expect_s3_class(test_result[[3]], c("shiny.tag"))
  expect_cleaned_html({
    test_result
  })
})
