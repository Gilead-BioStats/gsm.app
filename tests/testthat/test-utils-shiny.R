test_that("un_ns removes namespaces", {
  my_namespacer <- shiny::NS("test_namespace")
  namespaced <- my_namespacer("target")
  expect_identical(
    un_ns(namespaced, my_namespacer),
    "target"
  )
})

test_that("null_for_none does its job", {
  expect_null(null_for_none(NULL))
  expect_null(null_for_none(character()))
  expect_null(null_for_none("None"))
  expect_null(null_for_none("All"))
  expect_null(null_for_none(""))
  expect_identical(null_for_none("a"), "a")
  expect_identical(null_for_none(letters), letters)
})
