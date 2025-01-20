test_that("run_gsm_app initializes the expected app", {
  skip_on_cran()
  app <- AppDriver$new(test_path("apps", "standard"), name = "init")
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)
  app$expect_values(export = TRUE, name = "init")
  app$stop()
})

test_that("run_gsm_app populates Study Overview", {
  skip_on_cran()
  app <- AppDriver$new(test_path("apps", "standard"), name = "study")
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)
  app$expect_values(
    export = TRUE,
    name = "init",
    screenshot_args = list(selector = ".main")
  )

  # Scatter Plots subtab.
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$set_inputs(`study_overview-nav_bar` = "Scatter Plots")
  app$wait_for_js(
    "isCanvasLoaded('study_overview-scatter-Analysis_kri0001');",
    timeout = 2000
  )
  app$wait_for_js(
    "isCanvasLoaded('study_overview-scatter-Analysis_kri0004');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "plots",
    screenshot_args = list(selector = ".main")
  )

  # Click on AE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-Analysis_kri0001', '0X159');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "plots-ae-site",
    screenshot_args = list(selector = "#metric_details-scatter_plot")
  )

  # Set site via drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Study Overview")
  app$wait_for_js(
    "isCanvasLoaded('study_overview-scatter-Analysis_kri0001');",
    timeout = 2000
  )
  app$wait_for_js(
    "isCanvasLoaded('study_overview-scatter-Analysis_kri0004');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "plots-ae-site-dropdown",
    screenshot_args = list(selector = "#study_overview-scatter")
  )

  # Click on SAE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-Analysis_kri0002', '0X170');")
  app$set_inputs(
    `study_overview-scatter-selectedScatterPlot` = "study_overview-scatter-Analysis_kri0002",
    allow_no_input_binding_ = TRUE
  )
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "plots-sae-nav2metric",
    screenshot_args = list(selector = "#metric_details-scatter_plot")
  )
  app$stop()
})

test_that("run_gsm_app populates Metric Details", {
  skip_on_cran()
  app <- AppDriver$new(test_path("apps", "standard"), name = "metrics")
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)

  # Navigate to Metric Details tab.
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "scatter",
    screenshot_args = list(selector = ".main")
  )

  # Click through to each tab.
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_value",
    screenshot_args = list(selector = ".main")
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_score",
    screenshot_args = list(selector = ".main")
  )

  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
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
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "time-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-time_series', '0X001');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "time-site_click",
    screenshot_args = list(selector = ".active .tabbable")
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_score-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-bar_chart_score', '0X159');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_score-site_click",
    screenshot_args = list(selector = ".active .tabbable")
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_value-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-bar_chart_metric', '0X001');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_value-site_click",
    screenshot_args = list(selector = ".active .tabbable")
  )

  app$set_inputs(`metric_details-selected_tab` = "Scatter Plot")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "scatter-site",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-scatter_plot', '0X159');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "scatter-site_circle",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$stop()
})

test_that("run_gsm_app populates Domain Details", {
  skip_on_cran()
  app <- AppDriver$new(test_path("apps", "standard"), name = "domain")
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)

  # Navigate to Domain Details tab.
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "no-participant",
    screenshot_args = list(selector = ".main")
  )

  # Select a participant via the drop-down.
  app$set_inputs(`participant` = "0285")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "participant",
    screenshot_args = list(selector = ".main")
  )

  # Select another domain.
  app$set_inputs(`domain_details-selected_tab` = "STUDCOMP")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "sd",
    screenshot_args = list(selector = ".main")
  )

  app$stop()
})

test_that("run_gsm_app display Domain error", {
  skip_on_cran()
  app <- AppDriver$new(test_path("apps", "error"), name = "error")
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)

  # Trigger the error.
  app$set_inputs(site = "0X013")
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  app$set_inputs(`domain` = "LB")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "lb13",
    screenshot_args = list(selector = ".modal-content")
  )

  app$stop()
})
