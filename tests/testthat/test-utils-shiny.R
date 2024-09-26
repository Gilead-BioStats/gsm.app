test_that("un_ns removes namespaces", {
  my_namespacer <- shiny::NS("test_namespace")
  namespaced <- my_namespacer("target")
  expect_identical(
    un_ns(namespaced, my_namespacer),
    "target"
  )
})
