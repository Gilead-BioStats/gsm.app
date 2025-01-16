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
      rctv_strSiteID = reactiveVal("whatever")
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
      rctv_strSiteID = reactiveVal("None")
    ),
    {
      # Initialize the value first.
      session$setInputs(`Analysis_kri0001-plot` = "None")
      session$setInputs(`Analysis_kri0001-plot` = "0X003")
      expect_equal(rctv_strSiteID(), "0X003")
    }
  )
})

test_that("mod_ScatterPlotSet_Server selects plots based on outside selection", {
  testServer(
    mod_ScatterPlotSet_Server,
    args = list(
      id = "scatterSetTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strMetricID = reactiveVal("whatever"),
      rctv_strSiteID = reactiveVal("0X003")
    ),
    {
      getSelectedGroupIDs <- function(strMetricID) {
        this_output <- jsonlite::fromJSON(
          output[[paste0(strMetricID, "-plot")]]
        )
        this_output$x$lMetric$selectedGroupIDs
      }
      lMetricIDs <- unique(dfMetrics$MetricID)

      # Check initialization.
      outputSelections <- purrr::map_chr(lMetricIDs, getSelectedGroupIDs)
      expect_type(outputSelections, "character")
      expect_equal(
        outputSelections,
        rep("0X003", length(unique(sample_dfMetrics$MetricID)))
      )

      # Update the simulated outside input.
      rctv_strSiteID("0X005")
      session$flushReact()

      # Confirm that the outputs update.
      outputSelections <- purrr::map_chr(lMetricIDs, getSelectedGroupIDs)
      expect_type(outputSelections, "character")
      expect_equal(
        outputSelections,
        rep("0X005", length(unique(sample_dfMetrics$MetricID)))
      )

      # Update the simulated outside input to "None" (deselect).
      rctv_strSiteID("None")
      session$flushReact()

      # Confirm that the outputs update.
      outputSelections <- purrr::map(lMetricIDs, getSelectedGroupIDs)
      expect_type(outputSelections, "list")
      expected_result <- purrr::map(
        unique(sample_dfMetrics$MetricID),
        function(x) {
          NULL
        }
      )
      expect_equal(outputSelections, expected_result)
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
      rctv_strSiteID = reactiveVal("whatever")
    ),
    {
      # After clicking we get back just the metric.
      session$setInputs(selectedScatterPlot = "scatterSetTest-metric1")
      expect_equal(rctv_strMetricID(), "metric1")
    }
  )
})
