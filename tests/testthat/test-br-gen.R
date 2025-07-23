skip_if_not_br()
currently_debugging <- FALSE

test_that("BR-GEN-01: By default, the app will display a title generated from the study information in dfGroups.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-01",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_equal(app$get_text("title"), "TREE-10")
  expect_official_screenshot(app, name = "default-title", selector = ".navbar")
  app$stop()
})

test_that("BR-GEN-02: The app title can be customized at launch.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "custom-title"),
    variant = "br",
    name = "gen-02",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_equal(app$get_text("title"), "Custom Title")
  expect_official_screenshot(app, name = "custom-title", selector = ".navbar")
  app$stop()
})

test_that("BR-GEN-03: The user can navigate between the main sections of the app using a navigation bar at the top of the page.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-03",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_equal(app$get_value(input = "primary_nav_bar"), "Study Overview")

  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  expect_equal(app$get_value(input = "primary_nav_bar"), "Metric Details")
  expect_official_screenshot(app, name = "metric-details")

  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  expect_equal(app$get_value(input = "primary_nav_bar"), "Domain Details")
  expect_official_screenshot(app, name = "domain-details")

  app$stop()
})

test_that("BR-GEN-04: If the data contains more than one group level (e.g., 'Site' vs 'Country'), a 'Group Level' filter is displayed.", {
  skip_if(currently_debugging)
  # Multiple group levels.
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-04",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_equal(app$get_value(input = "group-level-select"), "Site")
  expect_official_screenshot(app, name = "multi-level", selector = ".navbar")
  app$stop()

  # Single group level.
  app <- AppDriver$new(
    app_dir = test_path("apps", "single-level"),
    variant = "br",
    name = "gen-04",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_null(app$get_value(input = "group-level-select"))
  expect_official_screenshot(app, name = "single-level", selector = ".navbar")
  app$stop()
})

test_that("BR-GEN-05: If the 'Group Level' filter is displayed, the user can filter the data by group level.", {
  skip_if(currently_debugging)
  site_choices <- c(
    "All",
    unique(sample_dfGroups$GroupID[sample_dfGroups$GroupLevel == "Site"])
  )
  country_choices <- c(
    "All",
    unique(sample_dfGroups$GroupID[sample_dfGroups$GroupLevel == "Country"])
  )
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-05",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_equal(app$get_text("#group-group-select-label"), "Site")
  group_choices <- stringr::str_squish(
    app$get_text("#group-group-select .vscomp-option-text")
  )
  expect_in(group_choices, site_choices)
  app$click(selector = "#group-group-select .vscomp-arrow")
  app$wait_for_idle()
  expect_official_screenshot(app, name = "site-choices")

  app$click(selector = "#group-group-select .vscomp-arrow")
  app$wait_for_idle()
  app$set_inputs(`group-level-select` = "Country")
  app$wait_for_idle()
  expect_equal(app$get_text("#group-group-select-label"), "Country")
  group_choices <- stringr::str_squish(
    app$get_text("#group-group-select .vscomp-option-text")
  )
  expect_in(group_choices, country_choices)
  app$click(selector = "#group-group-select .vscomp-arrow")
  app$wait_for_idle()
  expect_official_screenshot(app, name = "country-choices")
  app$stop()
})

test_that("BR-GEN-06: The user can filter the data by group (e.g., 'Site' or 'Country') within the selected 'Group Level'.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-06",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  participant_choices <- stringr::str_squish(
    app$get_text("#participant-select .vscomp-option-text")
  )
  n_groups_in_choices <- sample_dfAnalyticsInput %>%
    dplyr::filter(
      .data$GroupLevel == "Site",
      .data$SubjectID %in% participant_choices
    ) %>%
    dplyr::distinct(.data$GroupID) %>%
    nrow()
  expect_gt(n_groups_in_choices, 1)
  app$click(selector = "#participant-select .vscomp-arrow")
  app$wait_for_idle()
  expect_official_screenshot(app, name = "no_group-participants")

  app$click(selector = "#participant-select .vscomp-arrow")
  app$set_inputs(`group-group-select` = "0X7258")
  app$wait_for_idle()
  participant_choices <- stringr::str_squish(
    app$get_text("#participant-select .vscomp-option-text")
  )
  groups_in_choices <- sample_dfAnalyticsInput %>%
    dplyr::filter(
      .data$GroupLevel == "Site",
      .data$SubjectID %in% participant_choices
    ) %>%
    dplyr::pull("GroupID") %>%
    unique()
  expect_equal(groups_in_choices, "0X7258")
  app$click(selector = "#participant-select .vscomp-arrow")
  app$wait_for_idle()
  expect_official_screenshot(app, name = "group-selected-participants")

  app$stop()
})

test_that("BR-GEN-07: The user can filter the data by 'Participant'.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-07",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  domain_summary_counts_all <- as.integer(
    app$get_text("#domain_details-counts-card .metadata-list-item-value")
  )
  expect_official_screenshot(app, name = "counts-no-participant")

  app$set_inputs(`participant-select` = "S7900")
  app$wait_for_idle()
  domain_summary_counts_subset <- as.integer(
    app$get_text("#domain_details-counts-card .metadata-list-item-value")
  )
  expect_lt(domain_summary_counts_subset[[1]], domain_summary_counts_all[[1]])
  expect_official_screenshot(app, name = "counts-S7900")
  app$stop()
})

test_that("BR-GEN-08: The user can reset all filters to their default values.", {
  skip_if(currently_debugging)
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-08",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  app$set_inputs(`group-level-select` = "Country")
  app$wait_for_idle()
  app$set_inputs(`group-group-select` = "US")
  app$wait_for_idle()
  app$set_inputs(`participant-select` = "S10581")
  app$wait_for_idle()

  # Confirm inputs have changed.
  expect_equal(app$get_value(input = "group-level-select"), "Country")
  expect_equal(app$get_value(input = "group-group-select"), "US")
  expect_equal(app$get_value(input = "participant-select"), "S10581")
  expect_official_screenshot(app, name = "01-before", selector = ".navbar")

  # The reset button breaks the methods used by app, so from here we need to go
  # directly to chromote.
  if (isTRUE(as.logical(Sys.getenv("SHINYTEST2_TEST_SCREENSHOT")))) {
    sess <- app$get_chromote_session()
    p <- sess$Page$loadEventFired(wait_ = FALSE)
    app$click("reset")
    sess$wait_for(p)
    path <- withr::local_tempfile(fileext = ".png")
    expect_snapshot_file(
      sess$screenshot(
        filename = path,
        selector = ".navbar"
      ),
      "gen-08-02-after.png",
      variant = "br"
    )
  } else {
    succeed("Skipping screenshot test on this platform.")
  }

  app$stop()
})
