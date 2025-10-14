skip_if_not_qualifying()
skip_if_not_installed("shinytest2")

test_that("536: The user can view tabs provided by plugins.", {
  succeed()
  app <- br_app(
    app_dir = "plugin",
    name = "536",
    width = 1400
  )
  app$wait_for_idle()

  test_that("536.01: If a single plugin is included in the app, it appears as a new tab.", {
    nav_items <- app$get_text("#primary_nav_bar .nav-item a")
    expect_in("Participant Profile", nav_items)
    expect_false("Plugins" %in% nav_items)
    expect_official_screenshot(
      app,
      name = c("01", "single"),
      selector = ".navbar"
    )
  })

  test_that("536.02: If a plugin specifies required inputs, a placeholder is shown if that input is set to 'All'.", {
    app$set_inputs(primary_nav_bar = "Participant Profile")
    app$wait_for_idle()

    # Verify placeholder is shown when participant is "All"
    expect_equal(
      app$get_text("#plugins-001-plugin .placeholder .card-body"),
      "Please select a participant."
    )
    expect_official_screenshot(app, name = c("02", "01", "placeholder"))

    # Select a participant and verify plugin UI loads
    targetSubjectID <- sort(unique(sample_dfAnalyticsInput$SubjectID[
      sample_dfAnalyticsInput$GroupLevel == "Site"
    ]))[[2]]
    app$set_inputs(`participant-select` = targetSubjectID)
    app$wait_for_idle()
    expect_equal(
      app$get_text("#plugins-001-plugin-metadata-card h5"),
      "Participant Metadata"
    )
    expect_equal(
      app$get_text("#plugins-001-plugin-domains-card h5"),
      "Domain Summary"
    )
    expect_official_screenshot(app, name = c("02", "02", "loaded"))
  })
  app$stop()

  test_that("536.03: If multiple plugins are provided, they are grouped under a 'Plugins' dropdown menu in the navigation bar.", {
    app <- br_app(
      app_dir = "plugins",
      name = "536",
      width = 1400
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
    expect_official_screenshot(app, name = c("03", "multiple"))
    app$stop()
  })
})
