test_that("util_AsFunction works for unnamespaced functions", {
  test_result <- util_AsFunction("mean")
  expect_identical(test_result, mean)
})

test_that("util_AsFunction works for namespaced functions", {
  test_result <- util_AsFunction("shiny::reactive")
  expect_identical(test_result, shiny::reactive)
})

test_that("util_AsFunction works for bare functions", {
  test_result <- util_AsFunction(mean)
  expect_identical(test_result, mean)
})

test_that("util_AsFunction fails gracefully for non-installed packages", {
  # Register as non-interactive even while testing these.
  rlang::local_interactive(FALSE)
  expect_error(
    util_AsFunction("badpkg::func"),
    class = "packageNotFoundError"
  )
})
