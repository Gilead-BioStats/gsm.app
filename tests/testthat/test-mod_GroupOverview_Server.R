test_that("mod_GroupOverview_Server sets the expected reactives", {
  testServer(
    mod_GroupOverview_Server,
    args = list(
      id = "test_id",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      rctv_strMetricID = reactiveVal("xxxx"),
      rctv_strSiteID = reactiveVal("xxxx")
    ),
    {
      session$setInputs(
        group_overview = list(
          selectedGroupID = "aaaa",
          selectedMetricID = "bbbb",
          clickCounter = 1L
        )
      )
      expect_equal(rctv_strMetricID(), "bbbb")
      expect_equal(rctv_strSiteID(), "aaaa")
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
