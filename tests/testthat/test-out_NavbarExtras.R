test_that("out_NavbarExtras generates the expected UI", {
  chrSites <- sort(unique(
    sample_dfGroups$GroupID[sample_dfGroups$GroupLevel == "Site"]
  ))
  test_result <- out_NavbarExtras(chrSites)
  expect_type(test_result, c("list"))
  purrr::map(test_result, ~ expect_s3_class(.x, c("shiny.tag")))
  expect_cleaned_html({
    test_result
  })
})
