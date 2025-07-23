test_that("mod_StudyOverview_UI creates the expected UI", {
  test_result <- mod_StudyOverview_UI(
    "testID",
    dfGroups = sample_dfGroups,
    dfResults = sample_dfResults,
    dfMetrics = sample_dfMetrics
  )
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_StudyOverview_Server sets selected group and metric", {
  testServer(
    mod_StudyOverview_Server,
    args = list(
      id = "studyOverviewTest",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      dfBounds = sample_dfBounds,
      rctv_strMetricID = reactiveVal("Analysis_kri0002"),
      rctv_strGroupID = reactiveVal("0X7258"),
      rctv_strGroupLevel = reactiveVal("Site")
    ),
    {
      # Test the selected group reactive
      session$setInputs(`scatter-Analysis_kri0001-plot` = "All")
      expect_equal(rctv_strGroupID(), "All")
      session$setInputs(`scatter-Analysis_kri0001-plot` = "0X1372")
      expect_equal(rctv_strGroupID(), "0X1372")

      # Test the selected metric reactive
      # When we click a plot, it updates.
      session$setInputs(
        `scatter-selectedScatterPlot` = "studyOverviewTest-scatter-Analysis_kri0001"
      )
      expect_equal(rctv_strMetricID(), "Analysis_kri0001")

      # When we click the Group Overview, they update.
      session$setInputs(
        `table-group_overview` = list(
          selectedGroupID = "0X4579",
          selectedMetricID = "Analysis_kri0003",
          clickCounter = 1L
        )
      )
      expect_equal(rctv_strGroupID(), "0X4579")
      expect_equal(rctv_strMetricID(), "Analysis_kri0003")
    }
  )
})
