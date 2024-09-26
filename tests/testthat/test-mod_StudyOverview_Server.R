test_that("mod_StudyOverview_Server renders the site overview table", {
  testServer(
    mod_StudyOverview_Server,
    args = list(
      id = "studyOverviewTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strSiteID = reactiveVal("None")
    ),
    {
      expect_s3_class(output$site_overview_table, "json")
      test_result <- jsonlite::fromJSON(output$site_overview_table)
      expect_named(test_result, c("x", "evals", "jsHooks", "deps"))
      expect_named(
        test_result$x,
        c(
          "dfResults", "dfMetrics", "dfGroups", "strGroupLevel",
          "strGroupSubset", "strGroupLabelKey", "bDebug"
        )
      )
    }
  )
})

test_that("mod_StudyOverview_Server returns selected group and metric", {
  testServer(
    mod_StudyOverview_Server,
    args = list(
      id = "studyOverviewTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strSiteID = reactiveVal("0X003")
    ),
    {
      # Test the selected group reactive
      rctv_strSelectedGroup <- session$getReturned()$rctv_strSelectedGroup
      expect_s3_class(rctv_strSelectedGroup, "reactive")
      expect_null(rctv_strSelectedGroup())

      session$setInputs(`scatter-kri0001-group` = "0X005")
      expect_equal(rctv_strSelectedGroup(), "0X005")

      # Test the selected metric reactive
      rctv_strSelectectMetricID <- session$getReturned()$rctv_strSelectectMetricID
      expect_s3_class(rctv_strSelectectMetricID, "reactive")
      # It doesn't know that we initialize this in the wider app, so it starts
      # as nothing.
      expect_error(rctv_strSelectectMetricID(), class = "shiny.silent.error")

      # When we click a plot, it updates.
      session$setInputs(
        `scatter-selectedScatterPlot` = "studyOverviewTest-scatter-kri0001"
      )
      expect_equal(rctv_strSelectectMetricID(), "kri0001")
    }
  )
})
