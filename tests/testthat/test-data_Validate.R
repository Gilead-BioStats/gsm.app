test_that("validate_df throws informative errors", {
  expect_error(
    validate_df(1:10),
    "integer vector",
    class = "gsm.app-error-invalid_input"
  )
  expect_error(
    validate_df(data.frame(a = 1:10), chrRequiredColumns = "b"),
    "required columns",
    class = "gsm.app-error-invalid_input"
  )
})
