test_that("out_MainTabs generates the expected UI", {
  dfResults <- head(sample_dfResults[sample_dfResults$GroupLevel == "Site", ])
  chrDomains <- c(
    "AE", "ENROLL", "LB", "PD", "SDRGCOMP", "STUDCOMP",
    "SUBJ", "DATACHG", "DATAENT", "QUERY"
  )
  test_result <- gsmApp_UI(
    chrDomains,
    dfAnalyticsInput = head(sample_dfAnalyticsInput, 10),
    dfGroups = sample_dfGroups,
    dfMetrics = sample_dfMetrics,
    dfResults = dfResults
  )
  expect_s3_class(test_result, c("bslib_page", "shiny.tag.list", "list"))
  class(test_result) <- c("shiny.tag.list", "list")
  expect_cleaned_html({
    test_result
  })
})
