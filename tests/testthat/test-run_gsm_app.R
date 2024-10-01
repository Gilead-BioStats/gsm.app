# sample_df*_subset datasets are defined in helper-subsets.R

# devtools::install(".", quick = TRUE, upgrade = "never", quiet = TRUE)
# options(shinytest2.test = TRUE)

# Increased duration from default on all wait_for_idle steps to make sure page
# is fully loaded before screenshot.

test_that("run_gsm_app initializes the expected app", {
  skip_if_not_shinytesting()
  sample_app <- run_gsm_app(
    dfResults = sample_dfResults_subset,
    dfGroups = sample_dfGroups_subset,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput_subset,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  app <- AppDriver$new(sample_app, name = "init")
  # Without the wait, sometimes "Participants" isn't populated before the check.
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "init")
})

test_that("run_gsm_app populates Study Overview", {
  skip_if_not_shinytesting()
  sample_app <- run_gsm_app(
    dfResults = sample_dfResults_subset,
    dfGroups = sample_dfGroups_subset,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput_subset,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  app <- AppDriver$new(sample_app, name = "study")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "init")

  # Scatter Plots subtab.
  app$set_inputs(`study_overview-nav_bar` = "Scatter Plots")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "plots")

  # Click on AE plot.
  app$set_inputs(`study_overview-scatter-selectedScatterPlot` = "study_overview-scatter-kri0001", allow_no_input_binding_ = TRUE)
  app$set_inputs(`study_overview-scatter-kri0001-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "plots-ae-site")

  # Set site via drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "plots-ae-site-dropdown")

  # Click on SAE plot.
  app$set_inputs(`study_overview-scatter-selectedScatterPlot` = "study_overview-scatter-kri0002", allow_no_input_binding_ = TRUE)
  app$set_inputs(`study_overview-scatter-kri0001-group` = "0X161", allow_no_input_binding_ = TRUE)
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "plots-sae-nav2metric")
})

test_that("run_gsm_app populates Metric Details", {
  skip_if_not_shinytesting()
  sample_app <- run_gsm_app(
    dfResults = sample_dfResults_subset,
    dfGroups = sample_dfGroups_subset,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput_subset,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  app <- AppDriver$new(sample_app, name = "metrics")
  app$wait_for_idle(duration = 1000)

  # Navigate to Metric Details tab.
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "scatter")

  # Click through to each tab.
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "bar_value")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "bar_score")

  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "time")

  app$set_inputs(`metric_details-selected_tab` = "Analysis Output")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "analysis")

  # Choose a site in the drop-down.
  app$set_inputs(site = "0X001")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "analysis-site")

  # Click back through to make sure all have the site selected.
  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "time-site")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "bar_score-site")

  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "bar_value-site")

  app$set_inputs(`metric_details-selected_tab` = "Scatter Plot")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "scatter-site")

  app$set_inputs(`metric_details-scatter_plot-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "scatter-site_circle")
})

test_that("run_gsm_app populates Participant Details", {
  skip_if_not_shinytesting()
  sample_app <- run_gsm_app(
    dfResults = sample_dfResults_subset,
    dfGroups = sample_dfGroups_subset,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput_subset,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  app <- AppDriver$new(sample_app, name = "participants")
  app$wait_for_idle(duration = 1000)

  # Click "Metric Details" tab.
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "metric")

  # Select a site in the module.
  app$set_inputs(`metric_details-scatter_plot-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "metric-site")

  # Select a participant from that site.
  app$set_inputs(`site_details-participants-participant` = "0270", allow_no_input_binding_ = TRUE)
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "participant1")

  # Select AE data.
  app$click("participant_details-metric_summary-metric_list_choices-adverseEvents")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "ae")

  # Select a different participant via the drop-down.
  app$set_inputs(`participant` = "0244", allow_no_input_binding_ = TRUE)
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "participant2")

  # Select Study Disposition data.
  app$click("participant_details-metric_summary-metric_list_choices-studyDisposition")
  app$wait_for_idle(duration = 1000)
  app$expect_values(name = "sd")
})
