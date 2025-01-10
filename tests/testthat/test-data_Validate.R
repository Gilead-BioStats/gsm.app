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
  expect_no_error({
    test_result <- validate_dfResults(gsm.app::sample_dfResults)
  })
  expect_s3_class(test_result, "tbl_df")
})

test_that("Built-in dfGroups passes validation", {
  expect_no_error({
    test_result <- validate_dfGroups(gsm.app::sample_dfGroups)
  })
  expect_s3_class(test_result, "tbl_df")
})

test_that("Built-in dfMetrics passes validation", {
  expect_no_error({
    test_result <- validate_dfMetrics(gsm.app::sample_dfMetrics)
  })
  expect_s3_class(test_result, "tbl_df")
})

test_that("Built-in dfBounds passes validation", {
  expect_no_error({
    test_result <- validate_dfBounds(gsm.app::sample_dfBounds)
  })
  expect_s3_class(test_result, "tbl_df")
})

test_that("Built-in dfAnalyticsInput passes validation", {
  expect_no_error({
    test_result <- validate_dfAnalyticsInput(gsm.app::sample_dfAnalyticsInput)
  })
  expect_s3_class(test_result, "tbl_df")
})

test_that("validate_chrDomains fails gracefully", {
  expect_error(
    validate_chrDomains("NewDomain"),
    "NewDomain",
    class = "gsm.app-error-invalid_input"
  )
})

test_that("validate_chrDomains checks for domains used in plugins", {
  lPlugins <- list(
    p1 = list(
      domains = c("AE", "ENROLL")
    ),
    p2 = list(
      domains = c("AE", "SUBJ")
    )
  )
  chrDomains <- "ENROLL"
  expect_error(
    validate_chrDomains(chrDomains, lPlugins),
    "domains must be included",
    class = "gsm.app-error-invalid_input"
  )
})

test_that("validate_chrDomains returns valid domains", {
  expect_identical(
    validate_chrDomains("subj"),
    "SUBJ"
  )
})
