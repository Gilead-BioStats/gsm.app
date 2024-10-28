test_that("mod_RAGPillSet_UI creates the expected UI", {
  test_result <- mod_RAGPillSet_UI("pill_set_id", 12, 7)
  expect_s3_class(test_result, "shiny.tag")
  expect_cleaned_html({
    test_result
  })
})
