test_that("mod_ScatterPlot_UI creates the expected UI", {
  test_result <- mod_ScatterPlot_UI("myID")
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_ScatterPlot_UI uses title when it's supplied", {
  test_result <- mod_ScatterPlot_UI("myID", strPlotTitle = "myTitle")
  expect_identical(
    test_result$children[[2]]$children[[1]]$children[[1]][[1]]$name,
    "h5"
  )
  expect_identical(
    test_result$children[[2]]$children[[1]]$children[[1]][[1]]$children[[1]],
    "myTitle"
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_ScatterPlot_Server starts as expected", {
  call <- rlang::current_env()

  dfResults <- FilterbyMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "Analysis_kri0001"
  )
  dfGroups <- sample_dfGroups
  dfBounds <- FilterbyMetricID(sample_dfBounds, "Analysis_kri0001")
  lMetric <- as.list(FilterbyMetricID(sample_dfMetrics, "Analysis_kri0001"))

  testServer(
    mod_ScatterPlot_Server,
    args = list(
      id = "testingModScatterPlot",
      rctv_dfResults = reactive(dfResults),
      rctv_lMetric = reactive(lMetric),
      dfGroups = dfGroups,
      rctv_dfBounds = reactive(dfBounds),
      rctv_strGroupID = reactiveVal("All")
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

test_that("mod_ScatterPlot_Server sets selected group", {
  dfResults <- FilterbyMetricID(
    sample_dfResults[sample_dfResults$GroupLevel == "Site", ],
    "Analysis_kri0001"
  )
  dfGroups <- sample_dfGroups
  dfBounds <- FilterbyMetricID(sample_dfBounds, "Analysis_kri0001")
  lMetric <- as.list(FilterbyMetricID(sample_dfMetrics, "Analysis_kri0001"))
  testServer(
    mod_ScatterPlot_Server,
    args = list(
      id = "testingModScatterPlot",
      rctv_dfResults = reactive(dfResults),
      rctv_lMetric = reactive(lMetric),
      dfGroups = dfGroups,
      rctv_dfBounds = reactive(dfBounds),
      rctv_strGroupID = reactiveVal("All")
    ),
    {
      expect_null(input$plot)
      session$setInputs(plot = "0X7258")
      expect_equal(rctv_strGroupID(), "0X7258")

      session$setInputs(plot = NULL)
      expect_equal(rctv_strGroupID(), "All")
    }
  )
})
