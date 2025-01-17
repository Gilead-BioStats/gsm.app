test_that("mod_MetricDetails_UI creates the expected UI", {
  test_result <- mod_MetricDetails_UI("testID")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_MetricDetails_Server initializes and renders scatter plot", {
  # Inputs to simulate things that happen in the main server function.
  rctv_strMetricID <- reactiveVal("Analysis_kri0001")
  rctv_strSiteID <- reactiveVal("None")
  rctv_lMetric <- reactive({
    lMetric <- as.list(FilterbyMetricID(sample_dfMetrics, rctv_strMetricID()))
    if (rctv_strSiteID() != "None") {
      lMetric$selectedGroupIDs <- rctv_strSiteID()
    }
    lMetric
  })

  testServer(
    mod_MetricDetails_Server,
    args = list(
      id = "metricDetailsTest",
      dfResults = sample_dfResults,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_lMetric = rctv_lMetric,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strMetricID = rctv_strMetricID
    ),
    {
      # Manually set tab (happens automatically via UI).
      session$setInputs(selected_tab = "Scatter Plot")

      # Simulate selecting a group from the scatter plot
      session$setInputs(`scatter_plot-plot` = "0X005")
      expect_equal(rctv_strSiteID(), "0X005")
    }
  )
})

test_that("mod_MetricDetails_Server renders tab outputs", {
  call <- rlang::current_env()
  # Inputs to simulate things that happen in the main server function.
  rctv_strMetricID <- reactiveVal("Analysis_kri0001")
  rctv_strSiteID <- reactiveVal("None")
  rctv_lMetric <- reactive({
    lMetric <- as.list(FilterbyMetricID(sample_dfMetrics, rctv_strMetricID()))
    if (rctv_strSiteID() != "None") {
      lMetric$selectedGroupIDs <- rctv_strSiteID()
    }
    lMetric
  })

  testServer(
    mod_MetricDetails_Server,
    args = list(
      id = "metricDetailsTest",
      dfResults = sample_dfResults,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_lMetric = rctv_lMetric,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strMetricID = rctv_strMetricID
    ),
    {
      # Manually set tab (happens automatically via UI). Make sure the selected
      # site doesn't instantly change.
      session$setInputs(selected_tab = "Scatter Plot")
      expect_equal(rctv_strSiteID(), "None")
      session$setInputs(selected_tab = "Bar Chart (KRI Value)")
      expect_equal(rctv_strSiteID(), "None")
      session$setInputs(selected_tab = "Bar Chart (KRI Score)")
      expect_equal(rctv_strSiteID(), "None")
      session$setInputs(selected_tab = "Time Series")
      expect_equal(rctv_strSiteID(), "None")
      session$setInputs(selected_tab = "Analysis Output")
      expect_equal(rctv_strSiteID(), "None")
    }
  )
})
