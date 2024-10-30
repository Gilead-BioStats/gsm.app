test_that("run_gsm_app initializes the expected app", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
    name = "init"
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 8000)
  app$expect_values(export = TRUE, name = "init")
})

test_that("run_gsm_app populates Study Overview", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
    name = "study"
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 8000)
  app$expect_values(
    export = TRUE,
    name = "init",
    screenshot_args = list(selector = ".main")
  )

  # Scatter Plots subtab.
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$set_inputs(`study_overview-nav_bar` = "Scatter Plots")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-Analysis_kri0001');",
    timeout = 8000
  )
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-Analysis_kri0011');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "plots",
    # This one is somewhat unstable, so give it a little extra time to load.
    screenshot_args = list(delay = 2, selector = ".main")
  )

  # Click on AE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-Analysis_kri0001', '0X159');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-Analysis_kri0001');",
    timeout = 8000
  )
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-Analysis_kri0011');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "plots-ae-site",
    # This one is somewhat unstable, so give it a little extra time to load.
    screenshot_args = list(delay = 1, selector = "#metric_details-scatter_plot")
  )

  # Set site via drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Study Overview")
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-Analysis_kri0001');",
    timeout = 8000
  )
  app$wait_for_js(
    "isWidgetPlotLoaded('study_overview-scatter-Analysis_kri0011');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "plots-ae-site-dropdown",
    screenshot_args = list(selector = "#study_overview-scatter")
  )

  # Click on SAE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-Analysis_kri0002', '0X170');")
  app$set_inputs(`study_overview-scatter-selectedScatterPlot` = "study_overview-scatter-Analysis_kri0002", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "plots-sae-nav2metric",
    screenshot_args = list(selector = "#metric_details-scatter_plot")
  )
})

test_that("run_gsm_app populates Metric Details", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
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
  app$expect_values(
    export = TRUE,
    name = "scatter",
    # This one is somewhat unstable, so give it a little extra time to load.
    screenshot_args = list(delay = 1, selector = ".main")
  )

  # Click through to each tab.
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--Analysis_kri0001_Metric');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "bar_value",
    screenshot_args = list(selector = ".main")
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--Analysis_kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "bar_score",
    screenshot_args = list(selector = ".main")
  )

  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('timeSeries--Analysis_kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "time",
    screenshot_args = list(selector = ".main")
  )

  app$set_inputs(`metric_details-selected_tab` = "Analysis Output")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "analysis",
    screenshot_args = list(selector = ".main")
  )

  # Choose a site in the drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "analysis-site",
    screenshot_args = list(selector = ".active .tabbable")
  )

  # Click back through to make sure all have the site selected. Alternate
  # between 0X001 and 0X159 as we go.
  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('timeSeries--Analysis_kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "time-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('timeSeries--Analysis_kri0001_Score', '0X001');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('timeSeries--Analysis_kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "time-site_click",
    screenshot_args = list(selector = ".active .tabbable")
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--Analysis_kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "bar_score-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('barChart--Analysis_kri0001_Score', '0X159');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--Analysis_kri0001_Score');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "bar_score-site_click",
    screenshot_args = list(selector = ".active .tabbable")
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--Analysis_kri0001_Metric');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "bar_value-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('barChart--Analysis_kri0001_Metric', '0X001');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('barChart--Analysis_kri0001_Metric');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "bar_value-site_click",
    screenshot_args = list(selector = ".active .tabbable")
  )

  app$set_inputs(`metric_details-selected_tab` = "Scatter Plot")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "scatter-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-scatter_plot', '0X159');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )
  app$expect_values(
    export = TRUE,
    name = "scatter-site_circle",
    screenshot_args = list(selector = ".active .tabbable")
  )
})

test_that("run_gsm_app populates Participant Details", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
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
  app$expect_values(
    export = TRUE,
    name = "metric",
    screenshot_args = list(selector = ".main")
  )

  # Select a site in the module.
  app$run_js("clickWidgetPlotGroup('metric_details-scatter_plot', '0X159');")
  app$wait_for_idle()
  app$wait_for_js(
    "isWidgetPlotLoaded('metric_details-scatter_plot');",
    timeout = 8000
  )

  # Select a participant from that site.
  app$set_inputs(`site_details-participants-participant` = "0270", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "participant1",
    screenshot_args = list(selector = ".main")
  )

  # Select AE data.
  app$click("participant_details-metric_summary-metric_list_choices-AE")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "ae",
    screenshot_args = list(selector = "#participant_details-domain-card")
  )

  # Select a different participant via the drop-down.
  app$set_inputs(`participant` = "0285", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "participant2",
    screenshot_args = list(selector = ".main")
  )

  # Select Study Disposition data.
  app$click("participant_details-metric_summary-metric_list_choices-STUDCOMP")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "sd",
    screenshot_args = list(selector = "#participant_details-domain-card")
  )
})
