skip_if_not_br()

test_that("520: The app always indicates the study with which it is associated.", {
  test_that("520.01: By default, the app displays a title generated from the study information in dfGroups.", {
    test_that_br_app_title(
      app_dir = "standard",
      snapshot_name = "520-01",
      expected_title = "TREE-10",
      screenshot_name = "default_title"
    )
  })

  test_that("520.02: The app title can be customized at launch.", {
    test_that_br_app_title(
      app_dir = "custom-title",
      snapshot_name = "520-02",
      expected_title = "Custom Title",
      screenshot_name = "custom_title"
    )
  })
})

test_that("521: The user can filter the data.", {
  test_that("521.01: If the data contains more than one group level (e.g., 'Site' vs 'Country'), a 'Group Level' filter is displayed.", {
    # Multiple group levels.
    app <- br_app(
      app_dir = "standard",
      name = "521"
    )
    app$wait_for_idle()
    expect_equal(app$get_value(input = "group-level-select"), "Site")
    expect_official_screenshot(
      app,
      name = "01-multilevel",
      selector = ".navbar"
    )
    app$stop()

    # Single group level.
    app <- br_app(
      app_dir = "single_level",
      name = "521"
    )
    app$wait_for_idle()
    expect_null(app$get_value(input = "group-level-select"))
    expect_official_screenshot(
      app,
      name = "01-single_level",
      selector = ".navbar"
    )
    app$stop()
  })

  app <- br_app(
    app_dir = "standard",
    name = "521",
    screenshot_args = list(delay = 2)
  )
  app$wait_for_idle()

  test_that("521.02: If the 'Group Level' filter is displayed, the user can filter the data by group level.", {
    site_choices <- c(
      "All",
      unique(sample_dfGroups$GroupID[sample_dfGroups$GroupLevel == "Site"])
    )
    country_choices <- c(
      "All",
      unique(sample_dfGroups$GroupID[sample_dfGroups$GroupLevel == "Country"])
    )
    expect_equal(app$get_text("#group-group-select-label"), "Site")
    group_choices <- stringr::str_squish(
      app$get_text("#group-group-select .vscomp-option-text")
    )
    expect_in(group_choices, site_choices)
    app$click(selector = "#group-group-select .vscomp-arrow")
    app$wait_for_idle()
    expect_official_screenshot(app, name = "02-choices_site")

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
    app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
    app$wait_for_js(
      "isCanvasLoaded('metric_details-scatter_plot');",
      timeout = 2000
    )
    expect_official_screenshot(app, name = "02-choices_country")

    # Reset to starting state.
    app$click(selector = "#group-group-select .vscomp-arrow")
    app$set_inputs(`group-level-select` = "Site")
    app$wait_for_idle()
    app$set_inputs(`primary_nav_bar` = "Study Overview")
    app$wait_for_idle()
  })

  test_that("521.03: The user can filter the data by group (e.g., 'Site' or 'Country') within the selected 'Group Level'.", {
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
    expect_official_screenshot(app, name = "03-participants-no_group")

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
    expect_official_screenshot(app, name = "03-participants-group_selected")

    # Reset to starting state.
    app$click(selector = "#participant-select .vscomp-arrow")
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
    app$set_inputs(`primary_nav_bar` = "Study Overview")
    app$wait_for_idle()
  })

  # Detailed tests of counts superseded by BR #519.
  test_that("521.04: The user can filter the data by 'Participant'.", {
    app$set_inputs(primary_nav_bar = "Domain Details")
    app$wait_for_idle()
    expect_official_screenshot(app, name = "04-counts-no_participant")

    app$set_inputs(`participant-select` = "S7900")
    app$wait_for_idle()
    expect_official_screenshot(app, name = "04-counts-S7900")

    # Reset to starting state.
    app$set_inputs(`participant-select` = "All")
    app$wait_for_idle()
    app$set_inputs(`primary_nav_bar` = "Study Overview")
    app$wait_for_idle()
  })

  test_that("521.05: The user can reset all filters to their default values.", {
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
    expect_official_screenshot(
      app,
      name = "05-01-before_reset",
      selector = ".navbar"
    )

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
        "521-05-02-after_reset.png",
        variant = "br"
      )
    } else {
      succeed("Skipping screenshot test on this platform.")
    }
  })

  app$stop()
})

test_that("522: The user can drill down into views of different aspects of the data.", {
  app <- br_app(
    app_dir = "standard",
    name = "522"
  )
  app$wait_for_idle()

  # Screenshots updated by BR #519.
  test_that("522.01: The user can navigate between the main sections of the app using a navigation bar at the top of the page.", {
    expect_equal(app$get_value(input = "primary_nav_bar"), "Study Overview")

    app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
    app$set_inputs(primary_nav_bar = "Metric Details")
    app$wait_for_js(
      "isCanvasLoaded('metric_details-scatter_plot');",
      timeout = 2000
    )
    app$wait_for_idle()
    expect_equal(app$get_value(input = "primary_nav_bar"), "Metric Details")
    expect_official_screenshot(app, name = "01-metric_details")

    app$set_inputs(primary_nav_bar = "Domain Details")
    app$wait_for_idle()
    expect_equal(app$get_value(input = "primary_nav_bar"), "Domain Details")
    expect_official_screenshot(app, name = "01-domain_details")

    app$set_inputs(primary_nav_bar = "Study Overview")
  })

  app$stop()
})
