# This set of tests is slow, so it's hidden behind an option.
#
# Run this line before running the test. Test just this one file, most likely.

# options(shinytest2.test = TRUE)

# sample_df*_subset datasets are defined in helper-subsets.R

test_that("run_gsm_app initializes the expected app", {
  skip_if_not_shinytesting()
  app <- AppDriver$new(
    test_path("apps"),
    screenshot_args = list(delay = 1),
    name = "init"
  )
  # Without the wait, sometimes "Participants" isn't populated before the check.
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "init")
})

test_that("run_gsm_app populates Study Overview", {
  skip_if_not_shinytesting()
  app <- AppDriver$new(
    test_path("apps"),
    screenshot_args = list(delay = 1),
    name = "study"
  )
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "init")

  # Scatter Plots subtab.
  app$set_inputs(`study_overview-nav_bar` = "Scatter Plots")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "plots")

  # Click on AE plot.
  app$set_inputs(`study_overview-scatter-selectedScatterPlot` = "study_overview-scatter-kri0001", allow_no_input_binding_ = TRUE)
  app$set_inputs(`study_overview-scatter-kri0001-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "plots-ae-site")

  # Set site via drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "plots-ae-site-dropdown")

  # Click on SAE plot.
  app$set_inputs(`study_overview-scatter-selectedScatterPlot` = "study_overview-scatter-kri0002", allow_no_input_binding_ = TRUE)
  app$set_inputs(`study_overview-scatter-kri0001-group` = "0X161", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "plots-sae-nav2metric")
})

test_that("run_gsm_app populates Metric Details", {
  skip_if_not_shinytesting()
  app <- AppDriver$new(
    test_path("apps"),
    screenshot_args = list(delay = 1),
    name = "metrics"
  )
  app$wait_for_idle()

  # Navigate to Metric Details tab.
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "scatter")

  # Click through to each tab.
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "bar_value")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "bar_score")

  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle()
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
  app$expect_values(export = TRUE, name = "time-site")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "bar_score-site")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "bar_value-site")

  app$set_inputs(`metric_details-selected_tab` = "Scatter Plot")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "scatter-site")

  app$set_inputs(`metric_details-scatter_plot-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "scatter-site_circle")
})

test_that("run_gsm_app populates Participant Details", {
  skip_if_not_shinytesting()
  app <- AppDriver$new(
    test_path("apps"),
    screenshot_args = list(delay = 1),
    name = "participants"
  )
  app$wait_for_idle()

  # Click "Metric Details" tab.
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "metric")

  # Select a site in the module.
  app$set_inputs(`metric_details-scatter_plot-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
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
  app$set_inputs(`participant` = "0244", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "participant2")

  # Select Study Disposition data.
  app$click("participant_details-metric_summary-metric_list_choices-studyDisposition")
  app$wait_for_idle()
  app$expect_values(export = TRUE, name = "sd")
})
