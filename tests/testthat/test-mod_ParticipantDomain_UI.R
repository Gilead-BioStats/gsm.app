test_that("mod_ParticipantDomain_UI creates the expected UI", {
  test_result <- mod_ParticipantDomain_UI("data_table_card_id")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
