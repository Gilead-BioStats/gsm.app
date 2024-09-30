# sample_df*_subset datasets are defined in helper-subsets.R

# devtools::install(".", quick = TRUE, upgrade = "never", quiet = TRUE)
# options(shinytest2.test = TRUE)

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
  app <- AppDriver$new(sample_app, name = "run-sample-init")
  # Without the wait, sometimes "Participants" isn't populated before the check.
  app$wait_for_idle()
  app$expect_values()
})

test_that("run_sample_gsm_app populates Metric Details", {
  skip_if_not_shinytesting()
  sample_app <- run_gsm_app(
    dfResults = sample_dfResults_subset,
    dfGroups = sample_dfGroups_subset,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput_subset,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  app <- AppDriver$new(sample_app, name = "run-sample-metrics")
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$set_inputs(`metric_details-selected_tab` = "Analysis Output")
  app$set_inputs(site = "0X001")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`metric_details-selected_tab` = "Time Series")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Score)")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`metric_details-selected_tab` = "Bar Chart (KRI Value)")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`metric_details-selected_tab` = "Scatter Plot")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`metric_details-scatter_plot-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values()
})

test_that("run_sample_gsm_app populates Participant Details", {
  skip_if_not_shinytesting()
  sample_app <- run_gsm_app(
    dfResults = sample_dfResults_subset,
    dfGroups = sample_dfGroups_subset,
    dfMetrics = sample_dfMetrics,
    dfBounds = sample_dfBounds,
    dfAnalyticsInput = sample_dfAnalyticsInput_subset,
    fnFetchParticipantData = sample_FetchParticipantData
  )
  app <- AppDriver$new(sample_app, name = "run-sample-participants")
  app$wait_for_idle()
  app$set_inputs(primary_nav_bar = "Metric Details")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`metric_details-scatter_plot-group` = "0X159", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`site_details-participants-participant` = "0270", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values()
  app$click("participant_details-metric_summary-metric_list_choices-adverseEvents")
  app$wait_for_idle()
  app$expect_values()
  app$set_inputs(`participant` = "0244", allow_no_input_binding_ = TRUE)
  app$wait_for_idle()
  app$expect_values()
  app$click("participant_details-metric_summary-metric_list_choices-studyDisposition")
  app$wait_for_idle()
  app$expect_values()
})
