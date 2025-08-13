test_that("mod_StudyInformation_UI shows study info", {
  test_result <- mod_StudyInformation_UI(
    "study_information",
    sample_dfGroups,
    sample_dfResults
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html(test_result)
})
