test_that("mod_SiteParticipants_UI() creates the expected object", {
  test_result <- mod_SiteParticipants_UI("myUI")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
