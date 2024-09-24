test_that("out_KRIColor produces expected output", {
  test_result <- out_KRIColor(head(sample_dfResults))
  expect_s3_class(test_result, "shiny.tag")
  expect_cleaned_html({
    test_result
  })
})
