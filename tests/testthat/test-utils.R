test_that("UnNS removes namespaces", {
  my_namespacer <- NS("test_namespace")
  namespaced <- my_namespacer("target")
  expect_identical(
    UnNS(namespaced, my_namespacer),
    "target"
  )
})

test_that("NullifyEmpty does its job", {
  expect_null(NullifyEmpty(NULL))
  expect_null(NullifyEmpty(character()))
  expect_null(NullifyEmpty("None"))
  expect_null(NullifyEmpty("All"))
  expect_null(NullifyEmpty(""))
  expect_identical(NullifyEmpty("a"), "a")
  expect_identical(NullifyEmpty(letters), letters)
})

test_that("ColorScheme loads the expected colors", {
  expect_equal(ColorScheme("gray"), "#828282")
  expect_equal(ColorScheme("green"), "#3DAF06")
  expect_equal(ColorScheme("amber"), "#FEAA02")
  expect_equal(ColorScheme("red"), "#FF5859")
  expect_equal(ColorScheme(), "#828282")

  expect_equal(ColorScheme("gray", "light"), "#E5E5E5")
  expect_equal(ColorScheme("green", "light"), "#9ED782")
  expect_equal(ColorScheme("amber", "light"), "#FED480")
  expect_equal(ColorScheme("red", "light"), "#FFABAC")
  expect_equal(ColorScheme(strColorFamily = "light"), "#E5E5E5")
})

test_that("AsFunction works for unnamespaced functions", {
  test_result <- AsFunction("mean")
  expect_identical(test_result, mean)
})

test_that("AsFunction works for namespaced functions", {
  test_result <- AsFunction("shiny::reactive")
  expect_identical(test_result, reactive)
})

test_that("AsFunction works for bare functions", {
  test_result <- AsFunction(mean)
  expect_identical(test_result, mean)
})

test_that("AsFunction fails gracefully for non-installed packages", {
  # Register as non-interactive even while testing these.
  rlang::local_interactive(FALSE)
  expect_error(
    AsFunction("badpkg::func"),
    class = "packageNotFoundError"
  )
})
