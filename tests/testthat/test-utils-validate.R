test_that("CheckIsIn errors gracefully", {
  expect_error(
    CheckIsIn(c("a", "b"), c("a", "d")),
    "Unknown values",
    class = "gsm.app-error-vector-values"
  )
})

test_that("CheckDF throws informative errors", {
  expect_error(
    CheckDF(1:10),
    "integer vector",
    class = "gsm.app-error-invalid_input"
  )
  expect_error(
    CheckDF(data.frame(a = 1:10), chrRequiredColumns = "b"),
    "required columns",
    class = "gsm.app-error-invalid_input"
  )
})

test_that("CheckDF returns dfs when they're ok", {
  given_df <- data.frame(a = 1:10)
  expect_no_error({
    test_result <- CheckDF(given_df, chrRequiredColumns = "a")
  })
  expect_identical(test_result, given_df)
})
