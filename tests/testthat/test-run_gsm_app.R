skip_if_not_installed("shinytest2")

test_that("run_gsm_app initializes the expected app", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
    name = "init",
    width = 1200,
    height = 1200
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)
  app$expect_values(export = TRUE, name = "init")
  app$stop()
})

test_that("run_gsm_app populates Study Overview", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
    name = "study",
    width = 1200,
    height = 1200
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)
  app$expect_values(
    export = TRUE,
    name = "init",
    screenshot_args = list(selector = "div[data-value='Study Overview'")
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
    screenshot_args = list(
      selector = list(selector = "div[data-value='Study Overview'] .tabbable")
    )
  )

  # Click on AE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-Analysis_kri0001', '0X4579');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "plots-ae-group",
    screenshot_args = list(selector = "#metric_details-scatter_plot")
  )

  # Set group via drop-down.
  app$set_inputs(`group-group` = "0X7798")
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
    name = "plots-ae-group-dropdown",
    screenshot_args = list(selector = "#study_overview-scatter")
  )

  # Click on SAE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-Analysis_kri0002', '0X4579');")
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
  app <- AppDriver$new(
    test_path("apps", "standard"),
    name = "metrics",
    width = 1200,
    height = 1200
  )
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
    screenshot_args = list(selector = "div[data-value='Metric Details'")
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
    screenshot_args = list(selector = "div[data-value='Metric Details'")
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
    screenshot_args = list(selector = "div[data-value='Metric Details'")
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
    screenshot_args = list(selector = "div[data-value='Metric Details'")
  )

  app$set_inputs(`metric_details-selected_tab` = "Analysis Output")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "analysis",
    screenshot_args = list(selector = "div[data-value='Metric Details'")
  )

  # Choose a group in the drop-down.
  app$set_inputs(`group-group` = "0X5766")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "analysis-group",
    screenshot_args = list(selector = ".active .tabbable")
  )

  # Click back through to make sure all have the group selected. Alternate
  # between 0X5766 and 0X4579 as we go.
  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "time-group",
    screenshot_args = list(selector = ".active .tabbable")
  )
  # My click function doesn't work for time series except maybe if a thing is already selected.
  app$set_inputs(`group-group` = "0X4579")
  app$wait_for_idle()
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "time-group_select",
    screenshot_args = list(selector = ".active .tabbable")
  )

  app$set_inputs(`group-group` = "0X5766")
  app$wait_for_idle()
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "time-group_select2",
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
    name = "bar_score-group",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-bar_chart_score', '0X4579');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_score-group_click",
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
    name = "bar_value-group",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-bar_chart_metric', '0X5766');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "bar_value-group_click",
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
    name = "scatter-group",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$run_js("clickWidgetPlotGroup('metric_details-scatter_plot', '0X4579');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "scatter-group_circle",
    screenshot_args = list(selector = ".active .tabbable")
  )
  app$stop()
})

test_that("run_gsm_app populates Domain Details", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
    name = "domain",
    width = 1200,
    height = 1200
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)

  # Navigate to Domain Details tab.
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "no-participant",
    screenshot_args = list(selector = "div[data-value='Domain Details'")
  )

  # Select a participant via the drop-down.
  app$set_inputs(`participant` = "S7900")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "participant",
    screenshot_args = list(selector = "div[data-value='Domain Details'")
  )

  # Select another domain.
  app$set_inputs(`domain_details-selected_tab` = "STUDCOMP")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "sd",
    screenshot_args = list(selector = "div[data-value='Domain Details'")
  )

  # Select a domain via the Domain Summary.
  app$set_inputs(`domain_details-counts-domain_list_choices-ENROLL` = "click")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "domain_summary_click",
    screenshot_args = list(selector = "div[data-value='Domain Details'")
  )

  app$stop()
})

test_that("run_gsm_app display Domain error", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "error"),
    name = "error",
    width = 1200,
    height = 1200
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)

  # Trigger the error.
  app$set_inputs(`group-group` = "0X9640")
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Domain Details")
  app$wait_for_idle()
  app$set_inputs(`domain_details-selected_tab` = "LB")
  app$wait_for_idle()
  app$expect_values(
    export = TRUE,
    name = "lb13",
    screenshot_args = list(selector = ".modal-content")
  )

  app$stop()
})
