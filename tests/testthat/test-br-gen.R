skip_if_not_installed("shinytest2")
# skip_on_cran <- skip
test_that("BR-GEN-01: By default, the app will display a title generated from the study information in dfGroups.", {
  skip_on_cran()
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-01",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_equal(app$get_text("title"), "TREE-10")
  app$expect_screenshot(name = "default-title", selector = ".navbar")
  app$stop()
})

test_that("BR-GEN-02: The app title can be customized at launch.", {
  skip_on_cran()
  app <- AppDriver$new(
    app_dir = test_path("apps", "custom-title"),
    variant = "br",
    name = "gen-02",
    width = 1300,
    height = 800
  )
  app$wait_for_idle()
  expect_equal(app$get_text("title"), "Custom Title")
  app$expect_screenshot(name = "custom-title", selector = ".navbar")
  app$stop()
})

test_that("BR-GEN-03: The user can navigate between the main sections of the app using a navigation bar at the top of the page.", {
  skip_on_cran()
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
  app$expect_screenshot(name = "metric-details")

  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  expect_equal(app$get_value(input = "primary_nav_bar"), "Domain Details")
  app$expect_screenshot(name = "domain-details")

  app$stop()
})

test_that("BR-GEN-04: If the data contains more than one group level (e.g., 'Site' vs 'Country'), a 'Group Level' filter is displayed.", {
  skip_on_cran()
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
  app$expect_screenshot(name = "multi-level", selector = ".navbar")
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
  app$expect_screenshot(name = "single-level", selector = ".navbar")
  app$stop()
})

test_that("BR-GEN-05: If the 'Group Level' filter is displayed, the user can filter the data by group level.", {
  skip_on_cran()
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
  app$expect_screenshot(name = "site", selector = ".navbar")
  app$click(selector = "#group-group-select .vscomp-arrow")
  app$wait_for_idle()
  app$expect_screenshot(
    name = "site-choices",
    selector = "#group-group-select .vscomp-dropbox"
  )

  app$click(selector = "#group-group-select .vscomp-arrow")
  app$wait_for_idle()
  app$set_inputs(`group-level-select` = "Country")
  app$wait_for_idle()
  expect_equal(app$get_text("#group-group-select-label"), "Country")
  group_choices <- stringr::str_squish(
    app$get_text("#group-group-select .vscomp-option-text")
  )
  expect_in(group_choices, country_choices)
  app$expect_screenshot(name = "country", selector = ".navbar")
  app$click(selector = "#group-group-select .vscomp-arrow")
  app$wait_for_idle()
  app$expect_screenshot(
    name = "country-choices",
    selector = "#group-group-select .vscomp-dropbox"
  )
  app$stop()
})

test_that("BR-GEN-06: The user can filter the data by group (e.g., 'Site' or 'Country') within the selected 'Group Level'.", {
  skip_on_cran()
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
  app$expect_screenshot(name = "no_group", selector = ".navbar")
  app$click(selector = "#participant-select .vscomp-arrow")
  app$wait_for_idle()
  app$expect_screenshot(
    name = "no_group-participants",
    selector = "#participant-select .vscomp-dropbox"
  )

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
  app$expect_screenshot(name = "group-selected", selector = ".navbar")
  app$click(selector = "#participant-select .vscomp-arrow")
  app$wait_for_idle()
  app$expect_screenshot(
    name = "group-selected-participants",
    selector = "#participant-select .vscomp-dropbox"
  )

  app$stop()
})

test_that("BR-GEN-07: The user can filter the data by 'Participant'.", {
  skip_on_cran()
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
  app$expect_screenshot(
    name = "counts-no-participant",
    selector = "#domain_details-counts-card"
  )

  app$set_inputs(`participant-select` = "S7900")
  app$wait_for_idle()
  domain_summary_counts_subset <- as.integer(
    app$get_text("#domain_details-counts-card .metadata-list-item-value")
  )
  expect_lt(domain_summary_counts_subset[[1]], domain_summary_counts_all[[1]])
  app$expect_screenshot(
    name = "counts-S7900",
    selector = "#domain_details-counts-card"
  )
  app$stop()
})

test_that("BR-GEN-08: The user can reset all filters to their default values.", {
  skip_on_cran()
  app <- AppDriver$new(
    app_dir = test_path("apps", "standard"),
    variant = "br",
    name = "gen-09",
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
  app$expect_screenshot(name = "01-before", selector = ".navbar")

  # The reset button breaks the methods used by app, so from here we need to go
  # directly to chromote.
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
    "gen-09-02-after.png",
    variant = "br"
  )

  app$stop()
})
