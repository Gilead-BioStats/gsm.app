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
