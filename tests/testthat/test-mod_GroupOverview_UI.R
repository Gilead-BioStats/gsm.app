test_that("mod_GroupOverview_UI creates the expected UI", {
  test_result <- mod_GroupOverview_UI("test_id", sample_dfResults)
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
