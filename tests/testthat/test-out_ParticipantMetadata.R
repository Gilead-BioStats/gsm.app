test_that("out_ParticipantMetadata returns a default UI with empty data", {
  test_result <- out_ParticipantMetadata(lParticipantMetadata = list())
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("out_ParticipantMetadata returns the expected UI with data", {
  test_result <- out_ParticipantMetadata(
    list(
      Name = "Test Person",
      otherField = "Field value"
    )
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
