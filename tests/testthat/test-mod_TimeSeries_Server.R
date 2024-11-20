test_that("mod_TimeSeries_Server starts as expected", {
  call <- rlang::current_env()

  dfResults <- filter_byMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "Analysis_kri0001"
  )
  dfGroups <- sample_dfGroups
  dfBounds <- filter_byMetricID(sample_dfBounds, "Analysis_kri0001")
  lMetric <- as.list(filter_byMetricID(sample_dfMetrics, "Analysis_kri0001"))

  testServer(
    mod_TimeSeries_Server,
    args = list(
      id = "testingModTestingSeries",
      rctv_dfResults = reactive(dfResults),
      rctv_lMetric = reactive(lMetric),
      dfGroups = dfGroups,
      rctv_dfBounds = reactive(dfBounds)
    ),
    {
      test_result <- output$plot
      expect_s3_class(test_result, "json")
      expect_cleaned_html(
        {
          substr(test_result, 1, 1000)
        },
        call = call
      )
    }
  )
})

test_that("mod_TimeSeries_Server returns selected site", {
  dfResults <- filter_byMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "Analysis_kri0001"
  )
  dfGroups <- sample_dfGroups
  dfBounds <- filter_byMetricID(sample_dfBounds, "Analysis_kri0001")
  lMetric <- as.list(filter_byMetricID(sample_dfMetrics, "Analysis_kri0001"))
  testServer(
    mod_TimeSeries_Server,
    args = list(
      id = "testingModTimeSeries",
      rctv_dfResults = reactive(dfResults),
      rctv_lMetric = reactive(lMetric),
      dfGroups = dfGroups,
      rctv_dfBounds = reactive(dfBounds)
    ),
    {
      expect_null(input$plot)
      expect_null(session$returned())
      session$setInputs(plot = "0X003")
      expect_equal(session$returned(), "0X003")
    }
  )
})
