test_that("out_NavbarExtras generates the expected UI", {
  test_result <- out_NavbarExtras(sample_dfGroups)
  expect_type(test_result, c("list"))
  purrr::map(test_result, ~ expect_s3_class(.x, c("shiny.tag")))
  expect_cleaned_html({
    test_result
  })
})
