test_that("mod_GroupOverview_Server returns the expected reactives", {
  testServer(
    mod_GroupOverview_Server,
    args = list(
      id = "test_id",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups
    ),
    {
      returned <- session$getReturned()
      expect_type(returned, "list")
      expect_named(
        returned,
        c("rctv_strGroupID", "rctv_strMetricID", "rctv_intClickCounter")
      )
      expect_s3_class(returned$rctv_strGroupID, "reactiveVal")
      expect_s3_class(returned$rctv_strMetricID, "reactiveVal")
      expect_s3_class(returned$rctv_intClickCounter, "reactiveVal")

      session$setInputs(
        group_overview = list(
          selectedGroupID = "aaaa",
          selectedMetricID = "bbbb",
          clickCounter = 1L
        )
      )
      returned <- session$getReturned()
      expect_equal(returned$rctv_strGroupID(), "aaaa")
      expect_equal(returned$rctv_strMetricID(), "bbbb")
      expect_equal(returned$rctv_intClickCounter(), 1L)

      expect_equal(rctv_strGroupSubset(), "red")
    }
  )
})

test_that("mod_GroupOverview_Server passes group subset info around", {
  testServer(
    mod_GroupOverview_Server,
    args = list(
      id = "test_id",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups
    ),
    {
      expect_equal(rctv_strGroupSubset(), "red")
      session$setInputs(
        group_overview = list(groupSubset = "amber")
      )
      expect_equal(rctv_strGroupSubset(), "amber")
      session$setInputs(
        group_overview = list(groupSubset = "red/amber")
      )
      expect_equal(rctv_strGroupSubset(), "red/amber")
      session$setInputs(
        group_overview = list(groupSubset = "all")
      )
      expect_equal(rctv_strGroupSubset(), "all")
    }
  )
})
