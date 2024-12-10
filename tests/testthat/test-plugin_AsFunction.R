test_that("plugin_AsFunction works for unnamespaced functions", {
  test_result <- plugin_AsFunction("mean")
  expect_identical(test_result, mean)
})

test_that("plugin_AsFunction works for namespaced functions", {
  test_result <- plugin_AsFunction("shiny::reactive")
  expect_identical(test_result, shiny::reactive)
})

test_that("plugin_AsFunction works for bare functions", {
  test_result <- plugin_AsFunction(mean)
  expect_identical(test_result, mean)
})

test_that("plugin_AsFunction fails gracefully for non-installed packages", {
  # Register as non-interactive even while testing these.
  rlang::local_interactive(FALSE)
  expect_error(
    plugin_AsFunction("badpkg::func"),
    "for use by a gsm\\.app plugin"
  )
})
