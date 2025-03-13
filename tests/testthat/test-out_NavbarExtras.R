test_that("out_NavbarExtras generates the expected UI", {
  chrSites <- sort(unique(
    sample_dfGroups$GroupID[sample_dfGroups$GroupLevel == "Site"]
  ))
  test_result <- out_NavbarExtras(chrSites)
  expect_s3_class(test_result, c("shiny.tag.list", "list"))
  expect_cleaned_html({
    test_result
  })
})
