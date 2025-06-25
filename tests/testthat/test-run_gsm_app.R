skip_if_not_installed("shinytest2")

# Many tests refer to subset_inputs, which is created in helper-shinytest2.R,
# using the json snapshot created in the first test.

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
  # This expectation checks every input & output. We'll likely need to update
  # this one often, but it gives us an opportunity to see what changed.
  app$expect_values(name = "init", transform = scrub_expected)
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
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^study_overview-", include_full_screen = TRUE)
    ),
    name = "init",
    screenshot_args = list(selector = "div[data-value='Study Overview'"),
    transform = scrub_expected
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
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^study_overview-")
    ),
    name = "plots",
    screenshot_args = list(
      selector = list(selector = "div[data-value='Study Overview'] .tabbable")
    ),
    transform = scrub_expected
  )

  # Click on AE plot.
  app$run_js("clickWidgetPlotGroup('study_overview-scatter-Analysis_kri0001', '0X4579');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^study_overview-"),
      subset_inputs("^metric_details-")
    ),
    name = "plots-ae-group",
    screenshot_args = list(selector = "#metric_details-scatter_plot"),
    transform = scrub_expected
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
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^study_overview-")
    ),
    name = "plots-ae-group-dropdown",
    screenshot_args = list(selector = "#study_overview-scatter"),
    transform = scrub_expected
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
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^study_overview-"),
      subset_inputs("^metric_details-")
    ),
    name = "plots-sae-nav2metric",
    screenshot_args = list(selector = "#metric_details-scatter_plot"),
    transform = scrub_expected
  )
  app$stop()
})

test_that("run_gsm_app Study Overview works with GroupLevel", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "standard"),
    name = "study",
    width = 1200,
    height = 1200
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)

  # When Group Level changes, Enrolled column is populated.
  app$set_inputs(`group-level` = "Country")
  app$run_js(file = test_path("fixtures", "WidgetPlotTestHelpers.js"))
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Study Overview")
  app$wait_for_idle()
  app$set_inputs(`study_overview-table-kri_counts-red-toggle_pill` = "click")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^study_overview-")
    ),
    name = "enrolled",
    screenshot_args = list(selector = list(selector = "table.group-overview")),
    transform = scrub_expected
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
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "scatter",
    screenshot_args = list(selector = "div[data-value='Metric Details'"),
    transform = scrub_expected
  )

  # Click through to each tab.
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "bar_value",
    screenshot_args = list(selector = "div[data-value='Metric Details'"),
    transform = scrub_expected
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "bar_score",
    screenshot_args = list(selector = "div[data-value='Metric Details'"),
    transform = scrub_expected
  )

  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "time",
    screenshot_args = list(selector = "div[data-value='Metric Details'"),
    transform = scrub_expected
  )

  app$set_inputs(`metric_details-selected_tab` = "Analysis Output")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "analysis",
    screenshot_args = list(selector = "div[data-value='Metric Details'"),
    transform = scrub_expected
  )

  # Choose a group in the drop-down.
  app$set_inputs(`group-group` = "0X5766")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "analysis-group",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
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
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "time-group",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )

  # My click function doesn't work for time series except maybe if a thing is
  # already selected.
  app$set_inputs(`group-group` = "0X4579")
  app$wait_for_idle()
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "time-group_select",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )

  app$set_inputs(`group-group` = "0X5766")
  app$wait_for_idle()
  app$wait_for_js(
    "isCanvasLoaded('metric_details-time_series');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "time-group_select2",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "bar_score-group",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )
  app$run_js("clickWidgetPlotGroup('metric_details-bar_chart_score', '0X4579');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_score');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "bar_score-group_click",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "bar_value-group",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )

  app$run_js("clickWidgetPlotGroup('metric_details-bar_chart_metric', '0X5766');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-bar_chart_metric');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "bar_value-group_click",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )

  app$set_inputs(`metric_details-selected_tab` = "Scatter Plot")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "scatter-group",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
  )

  app$run_js("clickWidgetPlotGroup('metric_details-scatter_plot', '0X4579');")
  app$wait_for_js(
    "isCanvasLoaded('metric_details-scatter_plot');",
    timeout = 2000
  )
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^metric_details-")
    ),
    name = "scatter-group_circle",
    screenshot_args = list(selector = ".active .tabbable"),
    transform = scrub_expected
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
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^domain_details-")
    ),
    name = "no-participant",
    screenshot_args = list(selector = "div[data-value='Domain Details'"),
    transform = scrub_expected
  )

  # Select a participant via the drop-down.
  app$set_inputs(`participant` = "S7900")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^domain_details-")
    ),
    name = "participant",
    screenshot_args = list(selector = "div[data-value='Domain Details'"),
    transform = scrub_expected
  )

  # Select another domain.
  app$set_inputs(`domain_details-selected_tab` = "STUDCOMP")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^domain_details-")
    ),
    name = "sd",
    screenshot_args = list(selector = "div[data-value='Domain Details'"),
    transform = scrub_expected
  )

  # Select a domain via the Domain Summary.
  app$set_inputs(`domain_details-counts-domain_list_choices-ENROLL` = "click")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar",
      subset_inputs("^domain_details-")
    ),
    name = "domain_summary_click",
    screenshot_args = list(selector = "div[data-value='Domain Details'"),
    transform = scrub_expected
  )

  app$stop()
})

test_that("run_gsm_app displays Domain error", {
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

test_that("run_gsm_app displays participant plugin", {
  skip_on_cran()
  app <- AppDriver$new(
    test_path("apps", "plugin"),
    name = "partiprof",
    width = 1200,
    height = 1200
  )
  app$wait_for_idle()
  app$wait_for_value(input = "participant", timeout = 2000)

  # Display empty mod without participant
  app$set_inputs(primary_nav_bar = "Participant Profile")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar"
    ),
    name = "blank",
    screenshot_args = list(selector = "div[data-value='Participant Profile'"),
    transform = scrub_expected
  )

  # Display full mod when participant selected
  app$set_inputs(`participant` = "S7900")
  app$wait_for_idle()
  app$expect_values(
    input = c(
      "group-group",
      "group-level",
      "participant",
      "primary_nav_bar"
    ),
    name = "S7900",
    screenshot_args = list(selector = "div[data-value='Participant Profile'"),
    transform = scrub_expected
  )

  app$stop()
})
