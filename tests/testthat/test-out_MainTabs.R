test_that("out_MainTabs generates the expected UI", {
  dfResults <- head(sample_dfResults[sample_dfResults$GroupLevel == "Site", ])
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
  test_result <- out_MainTabs(
    chrDomains = chrDomains,
    dfGroups = sample_dfGroups,
    dfResults = dfResults,
    dfMetrics = sample_dfMetrics
  )
  expect_type(test_result, c("list"))
  expect_s3_class(test_result[[1]], c("shiny.tag"))
  expect_s3_class(test_result[[2]], c("shiny.tag"))
  expect_s3_class(test_result[[3]], c("shiny.tag"))
  expect_cleaned_html({
    test_result
  })
})
