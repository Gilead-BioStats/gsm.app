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

test_that("validate_df returns dfs when they're ok", {
  given_df <- data.frame(a = 1:10)
  expect_no_error({
    test_result <- validate_df(given_df, chrRequiredColumns = "a")
  })
  expect_identical(test_result, given_df)
})

test_that("Built-in dfResults passes validation", {
  expect_no_error(
    validate_dfResults(gsm.app::sample_dfResults)
  )
})

test_that("Built-in dfGroups passes validation", {
  expect_no_error(
    validate_dfGroups(gsm.app::sample_dfGroups)
  )
})

test_that("Built-in dfMetrics passes validation", {
  expect_no_error(
    validate_dfMetrics(gsm.app::sample_dfMetrics)
  )
})

test_that("Built-in dfBounds passes validation", {
  expect_no_error(
    validate_dfBounds(gsm.app::sample_dfBounds)
  )
})

test_that("Built-in dfAnalyticsInput passes validation", {
  expect_no_error(
    validate_dfAnalyticsInput(gsm.app::sample_dfAnalyticsInput)
  )
})
