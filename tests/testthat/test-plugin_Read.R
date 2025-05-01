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

test_that("plugin_Read works with package fields", {
  path <- test_path("fixtures", "plugins", "package_ok")
  expect_no_error({
    test_result <- plugin_Read(path)
  })
  expect_identical(
    test_result$packages,
    list(list(name = "pkg1"), list(name = "pkg2", remote = "remote_url"))
  )
})

test_that("plugin_Read checks package fields", {
  path <- test_path("fixtures", "plugins", "package_missing_name")
  expect_error(
    {
      plugin_Read(path)
    },
    class = "gsm.app-error-object-fields"
  )
  path <- test_path("fixtures", "plugins", "package_extra_field")
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
      spec = c("AE", "SUBJ"),
      packages = list(),
      required_inputs = character(),
      workflows = list(),
      config = list()
    )
  )
})

test_that("plugin_LoadDependencies loads dependencies", {
  skip_if_not_installed("here")
  expect_false(rlang::is_attached(rlang::pkg_env_name("here")))
  withr::defer({
    if (rlang::is_attached(rlang::pkg_env_name("here"))) {
      unloadNamespace("here")
    }
  })
  plugin_LoadDependencies(list(packages = list(list(name = "here"))))
  expect_true(rlang::is_attached(rlang::pkg_env_name("here")))
})

test_that("plugin_GetDependencySources gets plugin dependency sources", {
  test_result <- plugin_GetDependencySources(
    list(packages = list(
      list(name = "ggplot2"),
      list(name = "gsm.core", remote = "Gilead-BioStats/gsm.core@dev")
    ))
  )
  expect_identical(
    test_result,
    c("ggplot2", "Gilead-BioStats/gsm.core@dev")
  )
})
