test_that("out_SiteParticipants returns the expected UI", {
  test_result <- out_SiteParticipants(
    head(sample_dfAnalyticsInput),
    c("SubjectID", "NumeratorName", "DenominatorName", "MetricName")
  )
  expect_s3_class(test_result, c("datatables", "htmlwidget"))
  simplified <- htmltools::as.tags(test_result)
  expect_cleaned_html({
    simplified[[1]]
  })
  expect_cleaned_html({
    simplified[[2]]
  })
})
