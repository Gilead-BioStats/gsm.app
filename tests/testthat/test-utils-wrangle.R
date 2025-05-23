test_that("FilterbyGroupID filters by GroupID", {
  given <- dplyr::tibble(
    GroupID = 1:5,
    value = letters[1:5]
  )
  expect_identical(
    FilterbyGroupID(given, 3),
    dplyr::tibble(GroupID = 3L, value = "c")
  )
})

test_that("FilterbyGroupID deals with All", {
  given <- dplyr::tibble(
    GroupID = 1:5,
    value = letters[1:5]
  )
  expect_identical(
    FilterbyGroupID(given, "All"),
    given
  )
})

test_that("FilterbyMetricID filters by MetricID", {
  given <- dplyr::tibble(
    MetricID = 1:5,
    value = letters[1:5]
  )
  expect_identical(
    FilterbyMetricID(given, 3),
    dplyr::tibble(MetricID = 3L, value = "c")
  )
})

test_that("FindNonZeroDecimals finds the 10s place to round to", {
  # Integer values
  expect_equal(FindNonZeroDecimals(c(5, 10, 123)), 0)

  # Mixed decimals and integers
  expect_equal(FindNonZeroDecimals(c(1, 0.1, 0.01, 0.001)), 3)

  # Vector with a variety of decimals
  x <- c(0.1, 0.11, 0.111, 0.1111, 0.11111, 0.111111111)
  expect_equal(FindNonZeroDecimals(x, 10), 9)
  expect_equal(FindNonZeroDecimals(x, 9), 9)
  expect_equal(FindNonZeroDecimals(x, 8), 8)
  expect_equal(FindNonZeroDecimals(x, 7), 7)
  expect_equal(FindNonZeroDecimals(x, 6), 6)
  expect_equal(FindNonZeroDecimals(x, 5), 5)
  expect_equal(FindNonZeroDecimals(x, 4), 4)

  # Digits after intMaxDecimals don't matter.
  x <- c(0.1, 0.11, 0.111, 0.1111, 0.11111, 0.100000001)
  expect_equal(FindNonZeroDecimals(x, 10), 9)
  expect_equal(FindNonZeroDecimals(x, 9), 9)
  expect_equal(FindNonZeroDecimals(x, 8), 5)
})

test_that("FilterBefore filters before a date", {
  given <- dplyr::tibble(x = 1:5, dt = as.Date(1:5, origin = "1970-01-01"))
  expect_equal(
    FilterBefore(given, "dt", "1970-01-04"),
    dplyr::tibble(x = 1:2, dt = as.Date(1:2, origin = "1970-01-01"))
  )
})

test_that("FilterByLatestIfPresent filters if SnapshotDate exists", {
  given <- dplyr::tibble(x = 1:5, SnapshotDate = as.Date(1:5, origin = "1970-01-01"))
  expect_equal(
    FilterByLatestIfPresent(given),
    dplyr::tibble(x = 5L, SnapshotDate = as.Date(5L, origin = "1970-01-01"))
  )
})

test_that("FilterByLatestIfPresent does nothing if SnapshotDate doesn't exist", {
  given <- dplyr::tibble(x = 1:5)
  expect_no_error(FilterByLatestIfPresent(given))
})

test_that("FilterByGroupAndLevel adds GroupLevel when necessary", {
  given <- dplyr::tibble(GroupID = 1:5)
  dfGroups <- dplyr::tibble(GroupID = 1:5, GroupLevel = "Site")
  expect_no_error(
    FilterByGroupAndLevel(
      given,
      strGroupLevel = "Site",
      strGroupID = 3,
      dfGroups = dfGroups
    )
  )
})
