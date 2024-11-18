test_that("filter_byGroupID filters by GroupID", {
  given <- dplyr::tibble(
    GroupID = 1:5,
    value = letters[1:5]
  )
  expect_identical(
    filter_byGroupID(given, 3),
    dplyr::tibble(GroupID = 3L, value = "c")
  )
})

test_that("filter_byGroupID deals with None", {
  given <- dplyr::tibble(
    GroupID = 1:5,
    value = letters[1:5]
  )
  expect_identical(
    filter_byGroupID(given, "None"),
    given
  )
})

test_that("filter_byMetricID filters by MetricID", {
  given <- dplyr::tibble(
    MetricID = 1:5,
    value = letters[1:5]
  )
  expect_identical(
    filter_byMetricID(given, 3),
    dplyr::tibble(MetricID = 3L, value = "c")
  )
})

test_that("findNonZeroDecimals finds the 10s place to round to", {
  # Integer values
  expect_equal(findNonZeroDecimals(c(5, 10, 123)), 0)

  # Mixed decimals and integers
  expect_equal(findNonZeroDecimals(c(1, 0.1, 0.01, 0.001)), 3)

  # Vector with a variety of decimals
  x <- c(0.1, 0.11, 0.111, 0.1111, 0.11111, 0.111111111)
  expect_equal(findNonZeroDecimals(x, 10), 9)
  expect_equal(findNonZeroDecimals(x, 9), 9)
  expect_equal(findNonZeroDecimals(x, 8), 8)
  expect_equal(findNonZeroDecimals(x, 7), 7)
  expect_equal(findNonZeroDecimals(x, 6), 6)
  expect_equal(findNonZeroDecimals(x, 5), 5)
  expect_equal(findNonZeroDecimals(x, 4), 4)

  # Digits after intMaxDecimals don't matter.
  x <- c(0.1, 0.11, 0.111, 0.1111, 0.11111, 0.100000001)
  expect_equal(findNonZeroDecimals(x, 10), 9)
  expect_equal(findNonZeroDecimals(x, 9), 9)
  expect_equal(findNonZeroDecimals(x, 8), 5)
})
