test_that("mod_ParticipantMetricSummary_UI() returns the expected UI", {
  # This test is extremely fragile. For now I think this is our best option, but
  # I also want to make this test fail from time to time.
  expect_snapshot(
    {
      test_result <- mod_ParticipantMetricSummary_UI("metric_summary")
      class(test_result) <- "shiny.tag"
      test_result
    },
    transform = scrub_card_ids
  )
})
