test_that("mod_MetricDetails_Server initializes and renders scatter plot", {
  # Inputs to simulate things that happen in the main server function.
  rctv_input_metric <- reactiveVal("Analysis_kri0001")
  rctv_input_site <- reactiveVal("None")
  rctv_lMetric <- reactive({
    lMetric <- as.list(filter_byMetricID(sample_dfMetrics, rctv_input_metric()))
    if (rctv_input_site() != "None") {
      lMetric$selectedGroupIDs <- rctv_input_site()
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
      rctv_strSiteID = rctv_input_site,
      rctv_strMetricID = rctv_input_metric
    ),
    {
      # Set up the return-watcher.
      rctv_strScatterGroup <- session$getReturned()
      expect_s3_class(rctv_strScatterGroup, "reactive")

      # Manually set tab (happens automatically via UI).
      session$setInputs(selected_tab = "Scatter Plot")

      # Simulate selecting a group from the scatter plot
      session$setInputs(`scatter_plot-plot` = "0X005")
      expect_equal(rctv_strScatterGroup(), "0X005")
    }
  )
})

test_that("mod_MetricDetails_Server renders tab outputs", {
  call <- rlang::current_env()
  # Inputs to simulate things that happen in the main server function.
  rctv_input_metric <- reactiveVal("Analysis_kri0001")
  rctv_input_site <- reactiveVal("None")
  rctv_lMetric <- reactive({
    lMetric <- as.list(filter_byMetricID(sample_dfMetrics, rctv_input_metric()))
    if (rctv_input_site() != "None") {
      lMetric$selectedGroupIDs <- rctv_input_site()
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
      rctv_strSiteID = rctv_input_site,
      rctv_strMetricID = rctv_input_metric
    ),
    {
      # Set up the return-watcher.
      rctv_strScatterGroup <- session$getReturned()
      expect_s3_class(rctv_strScatterGroup, "reactive")

      # Manually set tab (happens automatically via UI).
      session$setInputs(selected_tab = "Scatter Plot")
      # The value isn't explicitly set inside the modules; they all return
      # `NULL`.
      expect_null(rctv_strScatterGroup())

      session$setInputs(selected_tab = "Bar Chart (KRI Value)")
      expect_null(rctv_strBarValueGroup())

      session$setInputs(selected_tab = "Bar Chart (KRI Score)")
      expect_null(rctv_strBarScoreGroup())

      session$setInputs(selected_tab = "Time Series")
      expect_null(rctv_strTimeSeriesGroup())

      session$setInputs(selected_tab = "Analysis Output")
      expect_type(output$`analysis_output-gt-table`, "list")
      expect_named(output$`analysis_output-gt-table`, c("html", "deps"))
    }
  )
})
