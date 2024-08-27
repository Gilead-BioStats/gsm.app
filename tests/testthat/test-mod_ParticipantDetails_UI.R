test_that("mod_ParticipantDetails_UI() returns the expected UI", {
  # This test is extremely fragile. For now I think this is our best option, but
  # I also want to make this test fail from time to time.
  expect_snapshot({
    mod_ParticipantDetails_UI("participant_details")
  })
})
