test_that("mod_ScatterPlot_Server starts as expected", {
  call <- rlang::current_env()

  dfResults <- filter_byMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "kri0001"
  )
  dfGroups <- sample_dfGroups
  dfBounds <- filter_byMetricID(sample_dfBounds, "kri0001")
  lMetric <- as.list(filter_byMetricID(sample_dfMetrics, "kri0001"))

  testServer(
    mod_ScatterPlot_Server,
    args = list(
      id = "testingModScatterPlot",
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

test_that("mod_ScatterPlot_Server returns selected site", {
  dfResults <- filter_byMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "kri0001"
  )
  dfGroups <- sample_dfGroups
  dfBounds <- filter_byMetricID(sample_dfBounds, "kri0001")
  lMetric <- as.list(filter_byMetricID(sample_dfMetrics, "kri0001"))
  testServer(
    mod_ScatterPlot_Server,
    args = list(
      id = "testingModScatterPlot",
      rctv_dfResults = reactive(dfResults),
      rctv_lMetric = reactive(lMetric),
      dfGroups = dfGroups,
      rctv_dfBounds = reactive(dfBounds)
    ),
    {
      expect_null(input$plot)
      expect_equal(session$returned(), "None")
      session$setInputs(plot = "0X003")
      expect_equal(session$returned(), "0X003")
    }
  )
})
