test_that("run_gsm_app initializes the expected app", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps"),
    name = "init"
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 8000)
  app$expect_values(export = TRUE, name = "init")
})

test_that("run_gsm_app populates Study Overview", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps"),
    name = "study"
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 8000)
  app$expect_values(export = TRUE, name = "init")

  # Scatter Plots subtab.
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$set_inputs(`study_overview-nav_bar` = "Scatter Plots")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-kri0001');",
    timeout = 8000
  )
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-kri0002');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "plots")

  # Click on AE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-kri0001', '0X159');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-kri0001');",
    timeout = 8000
  )
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-kri0002');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "plots-ae-site")

  # Set site via drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-kri0001');",
    timeout = 8000
  )
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-kri0002');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "plots-ae-site-dropdown")

  # Click on SAE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-kri0002', '0X161');")
  app$set_inputs(`study_overview-scatter-selectedScatterPlot` = "study_overview-scatter-kri0002", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "plots-sae-nav2metric")
})

test_that("run_gsm_app populates Metric Details", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps"),
    # screenshot_args = list(delay = 1),
    name = "metrics"
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 8000)

  # Navigate to Metric Details tab.
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "scatter")

  # Click through to each tab.
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--kri0001_Metric');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "bar_value")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "bar_score")

  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('timeSeries--kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "time")

  app$set_inputs(`metric_details-selected_tab` = "Analysis Output")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "analysis")

  # Choose a site in the drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "analysis-site")

  # Click back through to make sure all have the site selected.
  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('timeSeries--kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "time-site")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "bar_score-site")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--kri0001_Metric');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "bar_value-site")

  app$set_inputs(`metric_details-selected_tab` = "Scatter Plot")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "scatter-site")

  app$run_js("clickWidgetPlotGroup('metric_details-scatter_plot', '0X159');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "scatter-site_circle")
})

test_that("run_gsm_app populates Participant Details", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps"),
    screenshot_args = list(delay = 1),
    name = "participants"
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 8000)

  # Click "Metric Details" tab.
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "metric")

  # Select a site in the module.
  app$run_js("clickWidgetPlotGroup('metric_details-scatter_plot', '0X159');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(export = TRUE, name = "metric-site")

  # Select a participant from that site.
  app$set_inputs(`site_details-participants-participant` = "0270", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "participant1")

  # Select AE data.
  app$click("participant_details-metric_summary-metric_list_choices-adverseEvents")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "ae")

  # Select a different participant via the drop-down.
  app$set_inputs(`participant` = "0285", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "participant2")

  # Select Study Disposition data.
  app$click("participant_details-metric_summary-metric_list_choices-studyDisposition")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "sd")

  # Reset.
  app$click("reset")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "reset")
})
