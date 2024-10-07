test_that("mod_ScatterPlotSet_Server initializes and creates scatter plots", {
  testServer(
    mod_ScatterPlotSet_Server,
    args = list(
      id = "scatterSetTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strSiteID = reactive("None")
    ),
    {
      lMetricIDs <- unique(dfMetrics$MetricID)
      purrr::walk(lMetricIDs, function(strMetricID) {
        expect_s3_class(output[[paste0(strMetricID, "-plot")]], "json")
      })
    }
  )
})

test_that("mod_ScatterPlotSet_Server returns selected group correctly", {
  testServer(
    mod_ScatterPlotSet_Server,
    args = list(
      id = "scatterSetTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strSiteID = reactive("None")
    ),
    {
      # Initialize the value first.
      session$setInputs(`kri0001-plot` = "None")
      session$setInputs(`kri0001-plot` = "0X003")
      expect_equal(session$returned(), "0X003")
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
      expect_equal(outputSelections, c("0X003", "0X003"))

      # Update the simulated outside input.
      rctv_strSiteID("0X005")
      session$flushReact()

      # Confirm that the outputs update.
      outputSelections <- purrr::map_chr(lMetricIDs, getSelectedGroupIDs)
      expect_type(outputSelections, "character")
      expect_equal(outputSelections, c("0X005", "0X005"))

      # Update the simulated outside input to "None" (deselect).
      rctv_strSiteID("None")
      session$flushReact()

      # Confirm that the outputs update.
      outputSelections <- purrr::map(lMetricIDs, getSelectedGroupIDs)
      expect_type(outputSelections, "list")
      expect_equal(outputSelections, list(NULL, NULL))
    }
  )
})

test_that("mod_ScatterPlotSet_Server_MetricID returns selected metric", {
  testServer(
    mod_ScatterPlotSet_Server_MetricID,
    args = list(id = "scatterSetTest"),
    {
      rctv_toReturn <- session$getReturned()
      expect_s3_class(rctv_toReturn, "reactiveExpr")

      # Before we click anything the return is empty.
      expect_error(rctv_toReturn(), class = "shiny.silent.error")

      # After clicking we get back just the metric.
      session$setInputs(selectedScatterPlot = "scatterSetTest-metric1")
      expect_equal(rctv_toReturn(), "metric1")
    }
  )
})
