test_that("Built-in dfResults passes validation", {
  expect_no_error({
    test_result <- validate_dfResults(gsm.app::sample_dfResults)
  })
  expect_s3_class(test_result, "tbl_df")
})

test_that("Built-in dfGroups passes validation", {
  expect_no_error({
    test_result <- validate_dfGroups(
      gsm.app::sample_dfGroups,
      gsm.app::sample_dfResults
    )
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

test_that("validate_chrDomains checks for domains used in plugins", {
  lPlugins <- list(
    p1 = list(
      spec = list(AE = list(), ENROLL = list())
    ),
    p2 = list(
      spec = list(AE = list(), SUBJ = list())
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
    c(SUBJ = "subj")
  )
})

test_that("validate_lPlugins normalizes plugin names", {
  expect_null(validate_lPlugins(NULL))
  expect_named(
    validate_lPlugins(list(a = 1, 2, c = 3)),
    c("a", "002", "c")
  )
})
