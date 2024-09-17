test_that("sample_FetchParticipantData fails gracefully for unknown users", {
  expect_error(
    {
      sample_FetchParticipantData("nobody")
    },
    class = "gsm.app-error-unknown_strSubjectID"
  )
})

test_that("sample_FetchParticipantData returns expected data", {
  expect_no_error({
    test_result <- sample_FetchParticipantData("0001")
  })
  expect_named(test_result, c("metadata", "metric_data"))
  expect_named(
    test_result$metric_data,
    c(
      "adverseEvents",
      "protocolDeviations",
      "studyDisposition",
      "treatmentDisposition"
    )
  )
  expect_equal(nrow(test_result$metric_data$adverseEvents), 5)
  expect_equal(nrow(test_result$metric_data$protocolDeviations), 1)
  expect_equal(nrow(test_result$metric_data$studyDisposition), 0)
  expect_equal(nrow(test_result$metric_data$treatmentDisposition), 0)
})
