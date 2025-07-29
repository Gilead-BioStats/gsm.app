skip_if_not_br()
currently_debugging <- FALSE

test_that("BR-PG-01: If a single plugin is included in the app, it appears as a new tab.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "plugin"),
    variant = "br",
    name = "br-pg-01",
    width = 1400,
    height = 800
  )
  app$wait_for_idle()
  nav_items <- app$get_text("#primary_nav_bar .nav-item a")
  expect_in("Participant Profile", nav_items)
  expect_false("Plugins" %in% nav_items)
  expect_official_screenshot(app, name = "single", selector = ".navbar")
  app$stop()
})

test_that("BR-PG-02: If multiple plugins are provided, they are grouped under a 'Plugins' dropdown menu in the navigation bar.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "plugins"),
    variant = "br",
    name = "br-pg-02",
    width = 1400,
    height = 800
  )
  app$wait_for_idle()
  base_selector <- "#primary_nav_bar .nav-item.dropdown"
  menu_selector <- paste(base_selector, "a.dropdown-toggle")
  expect_equal(
    stringr::str_trim(app$get_text(menu_selector)),
    "Plugins"
  )
  expect_setequal(
    app$get_text(paste(base_selector, ".dropdown-menu .dropdown-item")),
    c("Plugin One", "Plugin Two")
  )

  app$run_js(
    glue::glue("document.querySelector('{menu_selector}').click();")
  )
  expect_official_screenshot(app, name = "multiple")
  app$stop()
})

test_that("BR-PG-03: If a plugin specifies required inputs, a placeholder is shown if that input is set to 'All'.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "plugin"),
    variant = "br",
    name = "br-pg-03",
    width = 1400,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Participant Profile")
  app$wait_for_idle()

  # Verify placeholder is shown when participant is "All"
  expect_equal(
    app$get_text("#plugins-001-plugin .placeholder .card-body"),
    "Please select a participant."
  )
  expect_official_screenshot(app, name = "placeholder")

  # Select a participant and verify plugin UI loads
  app$set_inputs(`participant-select` = "S7900")
  app$wait_for_idle()
  expect_equal(
    app$get_text("#plugins-001-plugin-metadata-card h5"),
    "Participant Metadata"
  )
  expect_equal(
    app$get_text("#plugins-001-plugin-domains-card h5"),
    "Domain Summary"
  )
  expect_official_screenshot(app, name = "loaded")

  app$stop()
})
