test_that("div_ParticipantMetadata returns a default UI with empty data", {
  # We will likely intentionally make this test fail in a lot of updates. Change
  # this comment once the returned UI is relatively solid.
  expect_snapshot({
    div_ParticipantMetadata(lParticipantMetadata = list())
  })
})

test_that("div_ParticipantMetadata returns the expected UI with data", {
  # We will likely intentionally make this test fail in a lot of updates. Change
  # this comment once the returned UI is relatively solid.
  expect_snapshot({
    div_ParticipantMetadata(
      list(
        Name = "Test Person",
        otherField = "Field value"
      )
    )
  })
})
