test_that("mod_ParticipantDomain_UI creates the expected UI", {
  expect_cleaned_html({
    test_result <- mod_ParticipantDomain_UI("data_table_card_id")
    class(test_result) <- "shiny.tag"
    test_result
  })
})
