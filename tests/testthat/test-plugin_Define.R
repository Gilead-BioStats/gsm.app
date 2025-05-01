test_that("plugin_Define errors informatively", {
  expect_error(
    plugin_Define(1:10, lSpec = list(), fnShinyUI = NULL, fnShinyServer = NULL),
    "integer vector",
    class = "gsm.app-error-invalid_input"
  )
  expect_error(
    {
      plugin_Define(
        strName = "Name",
        lSpec = list("AE" = list()),
        fnShinyUI = NULL, fnShinyServer = NULL,
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
      lSpec = list("AE" = list()),
      fnShinyUI = "ui",
      fnShinyServer = "server"
    ),
    list(
      meta = list(Name = "Name"),
      shiny = list(UI = "ui", Server = "server"),
      spec = list(AE = list()),
      packages = list(),
      required_inputs = character(),
      workflows = list(),
      config = list()
    )
  )
})
