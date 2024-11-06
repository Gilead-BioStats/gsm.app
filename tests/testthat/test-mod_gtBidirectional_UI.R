test_that("mod_gtBidirectional_UI() generates the expected UI", {
  test_result <- mod_gtBidirectional_UI("myUI")
  expect_s3_class(test_result, c("shiny.tag.list", "list"))
  expect_cleaned_html({
    test_result
  })
})
