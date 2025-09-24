skip_if_not_br()

# Snapshots updated by #519.
test_that("526: The user can view visualizations of a single KRI.", {
  app <- br_app(
    app_dir = "standard",
    name = "526",
    screenshot_args = list(delay = 2)
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )

  test_that("526.01: The user can select the KRI via a dropdown menu.", {
    # Default KRI
    target_kri <- "Analysis_kri0001"
    expect_equal(
      app$get_value(input = "metric_details-metric-select"),
      target_kri
    )
    expect_equal(
      app$get_js(
        "document.querySelector('#metric_details-scatter_plot-plot canvas').chart.data._config_.MetricID"
      ),
      target_kri
    )
    expect_official_screenshot(app, name = c("01", "01", "default_kri"))

    # Change KRI
    target_kri <- "Analysis_kri0002"
    app$set_inputs(`metric_details-metric-select` = target_kri)
    app$wait_for_idle()
    app$wait_for_js(
      "isCanvasLoaded('metric_details-scatter_plot');",
      timeout = 2000
    )
    expect_equal(
      app$get_value(input = "metric_details-metric-select"),
      target_kri
    )
    expect_equal(
      app$get_js(
        "document.querySelector('#metric_details-scatter_plot-plot canvas').chart.data._config_.MetricID"
      ),
      target_kri
    )
    expect_official_screenshot(app, name = c("01", "02", "changed_kri"))

    # Reset
    app$set_inputs(`metric_details-metric-select` = "Analysis_kri0001")
    app$wait_for_idle()
    app$wait_for_js(
      "isCanvasLoaded('metric_details-scatter_plot');",
      timeout = 2000
    )
  })

  test_that("526.02: The KRI selection dropdown is filtered to show only KRIs relevant to the selected 'Group Level'.", {
    dd_selector <- "#metric_details-metric-select"
    dd_text_selector <- paste(dd_selector, ".vscomp-option-text")
    dd_arrow_selector <- paste(dd_selector, ".vscomp-arrow")
    dd_choice_selector <- paste(dd_selector, ".vscomp-dropbox")

    # Site level
    site_metrics <- sample_dfMetrics %>%
      dplyr::filter(.data$GroupLevel == "Site") %>%
      dplyr::filter(.data$MetricID != "Analysis_srs0001") %>%
      dplyr::pull(.data$Metric)
    dropdown_options_site <- app$get_text(dd_text_selector) %>%
      stringr::str_squish()
    expect_setequal(dropdown_options_site, site_metrics)
    app$wait_for_js(
      "isCanvasLoaded('metric_details-scatter_plot');",
      timeout = 2000
    )
    app$click(selector = dd_arrow_selector)
    app$wait_for_idle()
    expect_official_screenshot(
      app,
      name = c("02", "site_choices"),
      selector = dd_choice_selector
    )

    # Country level
    app$set_inputs(`group-level-select` = "Country")
    app$wait_for_idle()
    country_metrics <- gsm.app::sample_dfMetrics %>%
      dplyr::filter(.data$GroupLevel == "Country") %>%
      dplyr::pull(.data$Metric)
    dropdown_options_country <- app$get_text(dd_text_selector) %>%
      stringr::str_squish()
    expect_setequal(dropdown_options_country, country_metrics)
    app$wait_for_js(
      "isCanvasLoaded('metric_details-scatter_plot');",
      timeout = 2000
    )
    # Close then re-open the menu.
    app$click(selector = dd_arrow_selector)
    app$wait_for_idle()
    app$click(selector = dd_arrow_selector)
    app$wait_for_idle()
    expect_official_screenshot(
      app,
      name = c("02", "country_choices"),
      selector = dd_choice_selector
    )

    # Reset
    app$click(selector = dd_arrow_selector)
    app$wait_for_idle()
    app$set_inputs(`group-level-select` = "Site")
    app$wait_for_idle()
    app$wait_for_js(
      "isCanvasLoaded('metric_details-scatter_plot');",
      timeout = 2000
    )
  })

  test_that("526.03: The user can navigate to different visualizations of this KRI via tabs.", {
    tabs <- rvest::read_html(app$get_html("body")) %>%
      rvest::html_elements(
        "#metric_details-selected_tab .nav-item:not(.inline-select) a"
      ) %>%
      rvest::html_text2() %>%
      stringr::str_squish()

    expected_tabs <- c(
      "Scatter Plot",
      "Bar Chart (KRI Value)",
      "Bar Chart (KRI Score)",
      "Time Series",
      "Analysis Output"
    )

    expect_setequal(tabs, expected_tabs)
    expect_official_screenshot(
      app,
      name = c("03", "tabs"),
      selector = "#metric_details-selected_tab"
    )
  })

  app$stop()
})

# Snapshots updated by #519.
test_that("527: The user can view an interactive scatter plot of the selected KRI's latest results.", {
  app <- br_app(
    app_dir = "standard",
    name = "527",
    screenshot_args = list(delay = 2)
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )

  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]

  test_that("527.01: The interactive scatter plot is based on `gsm.kri::Widget_ScatterPlot()`.", {
    expect_css_class(
      app$get_html("body"),
      "#metric_details-scatter_plot-plot",
      "Widget_ScatterPlot"
    )
    expect_official_screenshot(app, name = c("01", "scatter_plot"))
  })

  test_that("527.02: The selected group is highlighted in the interactive scatter plot.", {
    app$set_inputs(`group-group-select` = targetGroupID)
    app$wait_for_idle()
    selected_group_js <- app$get_js(
      "document.querySelector('#metric_details-scatter_plot-plot canvas').chart.data._config_.selectedGroupIDs"
    )
    expect_equal(selected_group_js, targetGroupID)
    expect_official_screenshot(app, name = c("02", "scatter_plot-selected"))

    # Reset
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
  })

  test_that("527.03: Clicking a group in the scatter plot updates the group drop-down.", {
    js <- glue::glue(
      "clickWidgetPlotGroup('metric_details-scatter_plot', '{targetGroupID}');"
    )
    app$run_js(js)
    app$wait_for_idle()
    expect_equal(app$get_value(input = "group-group-select"), targetGroupID)
    expect_official_screenshot(app, name = c("03", "scatter_plot-click"))
  })

  app$stop()
})

# Snapshots updated by #519.
test_that("528: The user can view an interactive bar chart of the selected KRI's latest metric values.", {
  app <- br_app(
    app_dir = "standard",
    name = "528"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]

  test_that("528.01: The interactive bar chart (value) is based on `gsm.kri::Widget_BarChart()`.", {
    expect_css_class(
      app$get_html("body"),
      "#metric_details-bar_chart_metric-plot",
      "Widget_BarChart"
    )
    expect_official_screenshot(app, name = c("01", "bar_chart-values"))
  })

  test_that("528.02: The selected group is highlighted in the interactive bar chart (value).", {
    app$set_inputs(`group-group-select` = targetGroupID)
    app$wait_for_idle()
    selected_group_js <- app$get_js(
      "document.querySelector('#metric_details-bar_chart_metric-plot canvas').chart.data._config_.selectedGroupIDs"
    )
    expect_equal(selected_group_js, targetGroupID)
    expect_official_screenshot(app, name = c("02", "bar_chart-values-selected"))

    # Reset
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
  })

  test_that("528.03: Clicking a group in the bar chart (value) updates the group drop-down.", {
    js <- glue::glue(
      "clickWidgetPlotGroup('metric_details-bar_chart_metric', '{targetGroupID}');"
    )
    app$run_js(js)
    app$wait_for_idle()
    expect_equal(app$get_value(input = "group-group-select"), targetGroupID)
    expect_official_screenshot(app, name = c("03", "bar_chart-values-click"))
  })

  app$stop()
})

# Snapshots updated by #519.
test_that("529: The user can view an interactive bar chart of the selected KRI's latest scores.", {
  app <- br_app(
    app_dir = "standard",
    name = "529"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )

  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]

  test_that("529.01: The interactive bar chart (score) is based on `gsm.kri::Widget_BarChart()`.", {
    expect_css_class(
      app$get_html("body"),
      "#metric_details-bar_chart_score-plot",
      "Widget_BarChart"
    )
    expect_official_screenshot(app, name = c("01", "bar_chart-scores"))
  })

  test_that("529.02: The selected group is highlighted in the interactive bar chart (score).", {
    app$set_inputs(`group-group-select` = targetGroupID)
    app$wait_for_idle()
    selected_group_js <- app$get_js(
      "document.querySelector('#metric_details-bar_chart_score-plot canvas').chart.data._config_.selectedGroupIDs"
    )
    expect_equal(selected_group_js, targetGroupID)
    expect_official_screenshot(app, name = c("02", "bar_chart-scores-selected"))

    # Reset
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
  })

  test_that("529.03: Clicking a group in the bar chart (score) updates the group drop-down.", {
    js <- glue::glue(
      "clickWidgetPlotGroup('metric_details-bar_chart_score', '{targetGroupID}');"
    )
    app$run_js(js)
    app$wait_for_idle()
    expect_equal(app$get_value(input = "group-group-select"), targetGroupID)
    expect_official_screenshot(app, name = c("03", "bar_chart-scores-click"))
  })

  app$stop()
})

# Snapshots updated by #519.
test_that("530: The user can view an interactive time-series plot of the selected KRI's scores across all available data snapshots.", {
  app <- br_app(
    app_dir = "standard",
    name = "530"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle()
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )

  targetGroupID <- sample_dfResults %>%
    dplyr::filter(
      MetricID == "Analysis_kri0001",
      abs(.data$Flag) > 0
    ) %>%
    dplyr::count(.data$GroupID, sort = TRUE) %>%
    utils::head(1) %>%
    dplyr::pull("GroupID")

  test_that("530.01: The interactive time-series plot is based on `gsm.kri::Widget_TimeSeries()`.", {
    expect_css_class(
      app$get_html("body"),
      "#metric_details-time_series-plot",
      "Widget_TimeSeries"
    )
    expect_official_screenshot(app, name = c("01", "time_series"))
  })

  test_that("530.02: The selected group is highlighted in the interactive time-series plot.", {
    app$set_inputs(`group-group-select` = targetGroupID)
    app$wait_for_idle()
    selected_group_js <- app$get_js(
      "document.querySelector('#metric_details-time_series-plot canvas').chart.data._config_.selectedGroupIDs"
    )
    expect_equal(selected_group_js, targetGroupID)
    expect_official_screenshot(app, name = c("02", "time_series-selected"))

    # Reset
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
  })

  test_that("530.03: Clicking a group in the time-series plot updates the group drop-down.", {
    # Find a site with flags in multiple snapshots, if possible.
    js <- glue::glue(
      "clickTimeSeriesGroup('metric_details-time_series', '{targetGroupID}');"
    )
    app$run_js(js)
    app$wait_for_idle()
    expect_equal(app$get_value(input = "group-group-select"), targetGroupID)
    expect_official_screenshot(app, name = c("03", "time_series-click"))
  })

  app$stop()
})

# Snapshots updated by #519.
test_that("531: The user can view a table of the KRI results for each group.", {
  app <- br_app(
    app_dir = "standard",
    name = "531"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$set_inputs(`metric_details-selected_tab` = "Analysis Output")
  app$wait_for_idle()

  targetGroupID <- sample_dfResults %>%
    dplyr::filter(
      MetricID == "Analysis_kri0001",
      abs(.data$Flag) > 0
    ) %>%
    dplyr::count(.data$GroupID, sort = TRUE) %>%
    utils::head(1) %>%
    dplyr::pull("GroupID")

  test_that("531.01: The KRI results table is generated by `gsm.kri::Report_MetricTable()`.", {
    expect_css_class(
      app$get_html("body"),
      "#metric_details-analysis_output-gt-table",
      "gt_shiny"
    )
    expect_setequal(
      app$get_text("#metric_details-analysis_output-gt-table .rt-th"),
      c(
        "", # Hidden selection checkbox column
        "Group",
        "Enrolled",
        "Numerator",
        "Denominator",
        "Metric",
        "Score",
        "Flag"
      )
    )
    expect_official_screenshot(app, name = c("01", "analysis_output"))
  })

  test_that("531.02: The selected group is highlighted in the KRI results table.", {
    app$set_inputs(`group-group-select` = targetGroupID)
    app$wait_for_idle()
    selected_group <- rvest::read_html(app$get_html("body")) %>%
      rvest::html_element("#metric_details-analysis_output-gt-table") %>%
      rvest::html_element(".rt-tr-selected .rt-td:nth-child(2)") %>%
      rvest::html_text2() %>%
      stringr::str_extract("^\\S+")
    expect_equal(selected_group, targetGroupID)
    expect_official_screenshot(app, name = c("02", "analysis_output-selected"))

    # Reset
    app$set_inputs(`group-group-select` = "All")
    app$wait_for_idle()
  })

  test_that("531.03: Clicking a group in the KRI results table updates the group drop-down.", {
    target_row_selector <- "#metric_details-analysis_output-gt-table .rt-tbody .rt-tr-group:nth-child(5)"
    target_cell_selector <- paste(target_row_selector, ".rt-td:nth-child(2)")
    target_group <- app$get_text(target_cell_selector) %>%
      stringr::str_extract("^\\S+")
    app$click(selector = target_cell_selector)
    app$wait_for_idle()
    expect_equal(app$get_value(input = "group-group-select"), target_group)
    expect_official_screenshot(app, name = c("03", "analysis_output-click"))
  })

  app$stop()
})

test_that("532: When a group is selected, the user can view that group's metadata.", {
  app <- br_app(
    app_dir = "standard",
    name = "532"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]

  test_that("532.01: The group metadata contains all information about this Group from the `dfGroups` input table.", {
    app$set_inputs(`group-group-select` = targetGroupID)
    app$wait_for_idle()
    group_details_selector <- "#group_details-card_group_metadata_list"
    expect_equal(
      app$get_text(paste(group_details_selector, "h5")),
      "Group Metadata"
    )
    group_metadata_elements <- rvest::read_html(app$get_html("body")) %>%
      rvest::html_element(group_details_selector) %>%
      rvest::html_elements(".metadata-list-item")
    expected_metadata <- sample_dfGroups %>%
      dplyr::filter(
        .data$GroupLevel == "Site",
        .data$GroupID == targetGroupID
      ) %>%
      dplyr::select("Param", "Value") %>%
      dplyr::mutate(
        Param = stringr::str_remove_all(.data$Param, "_") %>%
          tolower()
      ) %>%
      dplyr::arrange(.data$Param)
    group_metadata <- dplyr::tibble(
      Param = group_metadata_elements %>%
        rvest::html_element(".metadata-list-item-label") %>%
        rvest::html_text2() %>%
        stringr::str_remove_all("\\s") %>%
        tolower(),
      Value = group_metadata_elements %>%
        rvest::html_element(".metadata-list-item-value") %>%
        rvest::html_text2()
    ) %>%
      dplyr::arrange(.data$Param)
    expect_equal(group_metadata, expected_metadata)
    expect_official_screenshot(
      app,
      name = c("01", "group_metadata"),
      selector = "#group_details-card_group_metadata_list"
    )
  })

  app$stop()
})

# Snapshots updated by #519.
test_that("533: When a group is selected, the user can view a table of participants within that group.", {
  app <- br_app(
    app_dir = "standard",
    name = "533"
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  targetGroupID <- sample_dfGroups[
    sample_dfGroups$GroupLevel == "Site",
  ]$GroupID[[2]]
  app$set_inputs(`group-group-select` = targetGroupID)
  app$wait_for_idle()

  test_that("533.01: The participant table shows each participant's numerator, denominator, and metric values for the selected KRI.", {
    participants_selector <- "#group_details-participants-"
    expect_equal(
      app$get_text(paste0(participants_selector, "title")),
      glue::glue("Site: {targetGroupID}")
    )
    expect_equal(
      app$get_text(paste0(participants_selector, "subtitle")),
      "Click rows for participant details"
    )
    expected_participants <- sample_dfAnalyticsInput %>%
      dplyr::filter(
        .data$SnapshotDate == "2012-03-31",
        .data$GroupLevel == "Site",
        .data$MetricID == "Analysis_kri0001",
        .data$GroupID == targetGroupID,
        .data$Denominator > 15
      ) %>%
      dplyr::arrange(dplyr::desc(.data$Metric)) %>%
      dplyr::mutate(
        Metric = round(Metric, 5)
      ) %>%
      dplyr::select(
        "SubjectID",
        "Adverse Events" = "Numerator",
        "Days on Study" = "Denominator",
        "Adverse Event Rate" = "Metric"
      )
    participant_rows <- rvest::read_html(app$get_html("body")) %>%
      rvest::html_element(paste0(participants_selector, "gt-table")) %>%
      rvest::html_elements(".rt-tbody .rt-tr")
    participant_data <- dplyr::tibble(
      SubjectID = participant_rows %>%
        rvest::html_elements(".rt-td:nth-child(2) .rt-text-content") %>%
        rvest::html_text2(),
      "Adverse Events" = participant_rows %>%
        rvest::html_elements(".rt-td:nth-child(3) .rt-text-content") %>%
        rvest::html_text2() %>%
        as.double(),
      "Days on Study" = participant_rows %>%
        rvest::html_elements(".rt-td:nth-child(4) .rt-text-content") %>%
        rvest::html_text2() %>%
        as.double(),
      "Adverse Event Rate" = participant_rows %>%
        rvest::html_elements(".rt-td:nth-child(5) .rt-text-content") %>%
        rvest::html_text2() %>%
        as.double()
    )
    expect_equal(participant_data, expected_participants)
    expect_official_screenshot(
      app,
      name = c("01", "participant_table"),
      selector = paste0(participants_selector, "gt_card")
    )
  })

  # Screenshots updated by BR #519.
  test_that("533.02: Clicking a participant in the participant table selects that participant and navigates to the Domain Details tab.", {
    selector <- "#group_details-participants-gt-table .rt-tbody .rt-tr-group:nth-child(1) .rt-tr .rt-td:nth-child(2) .rt-text-content"
    subject_id <- app$get_text(selector)
    app$click(selector = selector)
    app$wait_for_idle()
    expect_equal(app$get_value(input = "primary_nav_bar"), "Domain Details")
    expect_equal(app$get_value(input = "participant-select"), subject_id)
    expect_official_screenshot(app, name = c("02", "participant_table-click"))
  })

  app$stop()
})
