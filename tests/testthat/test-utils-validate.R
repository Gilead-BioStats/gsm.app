test_that("validate_in errors gracefully", {
  expect_error(
    validate_in(c("a", "b"), c("a", "d")),
    "Unknown values",
    class = "gsm.app-error-vector-values"
  )
})
