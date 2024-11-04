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
      rctv_strSelectedGroupID <- session$getReturned()$rctv_strSelectedGroupID
      expect_s3_class(rctv_strSelectedGroupID, "reactive")
      expect_null(rctv_strSelectedGroupID())

      session$setInputs(`scatter-Analysis_kri0001-plot` = "None")
      session$setInputs(`scatter-Analysis_kri0001-plot` = "0X005")
      expect_equal(rctv_strSelectedGroupID(), "0X005")

      # Test the selected metric reactive
      rctv_strSelectedMetricID <- session$getReturned()$rctv_strSelectedMetricID
      expect_s3_class(rctv_strSelectedMetricID, "reactive")

      # When we click a plot, it updates.
      session$setInputs(
        `scatter-selectedScatterPlot` = "studyOverviewTest-scatter-Analysis_kri0001"
      )
      expect_equal(rctv_strSelectedMetricID(), "Analysis_kri0001")
    }
  )
})
