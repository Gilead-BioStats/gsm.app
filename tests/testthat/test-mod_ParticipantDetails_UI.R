test_that("mod_ParticipantDetails_UI() returns the expected UI", {
  test_result <- mod_ParticipantDetails_UI("participant_details")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
