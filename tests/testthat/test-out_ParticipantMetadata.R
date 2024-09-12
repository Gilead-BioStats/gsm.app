test_that("out_ParticipantMetadata returns a default UI with empty data", {
  # We will likely intentionally make this test fail in a lot of updates. Change
  # this comment once the returned UI is relatively solid.
  expect_snapshot(
    {
      test_result <- out_ParticipantMetadata(lParticipantMetadata = list())
      class(test_result) <- "shiny.tag"
      test_result
    },
    transform = scrub_card_ids
  )
})

test_that("out_ParticipantMetadata returns the expected UI with data", {
  # We will likely intentionally make this test fail in a lot of updates. Change
  # this comment once the returned UI is relatively solid.
  expect_snapshot(
    {
      test_result <- out_ParticipantMetadata(
        list(
          Name = "Test Person",
          otherField = "Field value"
        )
      )
      class(test_result) <- "shiny.tag"
      test_result
    },
    transform = scrub_card_ids
  )
})
