test_that("plugin_Define errors informatively", {
  expect_error(
    plugin_Define(1:10),
    "integer vector",
    class = "gsm.app-error-invalid_input"
  )
  expect_error(
    {
      plugin_Define(
        strName = "Name",
        chrDomains = "AE",
        chrRequiredInputs = "bad-input"
      )
    },
    class = "gsm.app-error-vector-values"
  )
})

test_that("plugin_Define works for valid definitions", {
  expect_identical(
    plugin_Define(
      strName = "Name",
      chrDomains = "AE",
      fnShinyUI = "ui",
      fnShinyServer = "server"
    ),
    list(
      meta = list(Name = "Name"),
      shiny = list(UI = "ui", Server = "server"),
      domains = "AE"
    )
  )
})
