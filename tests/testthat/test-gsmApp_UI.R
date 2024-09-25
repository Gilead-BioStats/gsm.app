test_that("out_MainTabs generates the expected UI", {
  dfResults <- head(sample_dfResults[sample_dfResults$GroupLevel == "Site", ])
  test_result <- gsmApp_UI(
    dfResults,
    sample_dfMetrics,
    sample_dfGroups,
    10L
  )
  expect_s3_class(test_result, c("bslib_page", "shiny.tag.list", "list"))
  class(test_result) <- c("shiny.tag.list", "list")
  expect_cleaned_html({
    test_result
  })
})
