test_that("out_KRIColor produces expected output", {
  expect_cleaned_html({
    out_KRIColor(head(sample_dfResults))
  })
})
