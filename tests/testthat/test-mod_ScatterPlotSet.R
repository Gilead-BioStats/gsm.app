test_that("mod_ScatterPlotSet_UI creates the expected UI", {
  test_result <- mod_ScatterPlotSet_UI(
    "myID",
    c(mod1 = "a", mod2 = "b", mod3 = "c")
  )
  expect_s3_class(test_result, c("shiny.tag.list", "list"))
  expect_s3_class(test_result[[1]], c("bslib_fragment", "shiny.tag"))
  expect_s3_class(test_result[[2]], c("shiny.tag.list", "list"))
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_ScatterPlotSet_Server initializes and creates scatter plots", {
  testServer(
    mod_ScatterPlotSet_Server,
    args = list(
      id = "scatterSetTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strMetricID = reactiveVal("whatever"),
      rctv_strGroupID = reactiveVal("whatever")
    ),
    {
      lMetricIDs <- unique(dfMetrics$MetricID)
      purrr::walk(lMetricIDs, function(strMetricID) {
        expect_s3_class(output[[paste0(strMetricID, "-plot")]], "json")
      })
    }
  )
})

test_that("mod_ScatterPlotSet_Server sets selected group correctly", {
  testServer(
    mod_ScatterPlotSet_Server,
    args = list(
      id = "scatterSetTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strMetricID = reactiveVal("whatever"),
      rctv_strGroupID = reactiveVal("All")
    ),
    {
      # Initialize the value first.
      session$setInputs(`Analysis_kri0001-plot` = "All")
      session$setInputs(`Analysis_kri0001-plot` = "0X2096")
      expect_equal(rctv_strGroupID(), "0X2096")
    }
  )
})

test_that("mod_ScatterPlotSet_Server sets selected metric", {
  testServer(
    mod_ScatterPlotSet_Server,
    args = list(
      id = "scatterSetTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strMetricID = reactiveVal("whatever"),
      rctv_strGroupID = reactiveVal("whatever")
    ),
    {
      # After clicking we get back just the metric.
      session$setInputs(selectedScatterPlot = "scatterSetTest-metric1")
      expect_equal(rctv_strMetricID(), "metric1")
    }
  )
})
