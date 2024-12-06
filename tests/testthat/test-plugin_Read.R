test_that("plugin_Read checks for yaml existence", {
  path <- test_path("fixtures", "plugins", "doesnotexist")
  expect_error(
    {
      plugin_Read(path)
    },
    class = "gsm.app-error-plugin-yaml"
  )
})

test_that("plugin_Read checks definition fields", {
  path <- test_path("fixtures", "plugins", "missing_fields")
  expect_error(
    {
      plugin_Read(path)
    },
    class = "gsm.app-error-object-fields"
  )

  path <- test_path("fixtures", "plugins", "extra_fields")
  expect_error(
    {
      plugin_Read(path)
    },
    class = "gsm.app-error-object-fields"
  )
})

test_that("plugin_Read reads associated R code", {
  path <- test_path("fixtures", "plugins", "has_r")
  expect_no_error({
    plugin_Read(path)
  })
  expect_type(mod_UI, "closure")
  expect_type(mod_Server, "closure")
})

test_that("plugin_Read returns the expected object", {
  path <- test_path("fixtures", "plugins", "has_r")
  expect_no_error({
    plugin_definition <- plugin_Read(path)
  })
  expect_identical(
    plugin_definition,
    list(
      meta = list(Type = "Plugin", ID = "ID", Name = "Title"),
      shiny = list(UI = "mod_UI", Server = "mod_Server"),
      domains = c("AE", "SUBJ")
    )
  )
})
