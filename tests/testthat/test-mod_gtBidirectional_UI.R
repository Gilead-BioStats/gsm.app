test_that("mod_gtBidirectional_UI() generates the expected UI", {
  test_result <- mod_gtBidirectional_UI("myUI")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})
