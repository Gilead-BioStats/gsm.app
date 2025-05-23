test_that("mod_GroupOverview_UI creates the expected UI", {
  latest_dfResults <- gsm.kri::FilterByLatestSnapshotDate(sample_dfResults)
  test_result <- mod_GroupOverview_UI("test_id", latest_dfResults)
  expect_s3_class(test_result, c("bslib_fragment", "shiny.tag"))
  class(test_result) <- "shiny.tag"
  expect_cleaned_html({
    test_result
  })
})

test_that("mod_GroupOverview_Server sets the expected reactives", {
  testServer(
    mod_GroupOverview_Server,
    args = list(
      id = "test_id",
      dfResults = sample_dfResults,
      dfMetrics = sample_dfMetrics,
      dfGroups = sample_dfGroups,
      rctv_strMetricID = reactiveVal("xxxx"),
      rctv_strGroupID = reactiveVal("xxxx")
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
      expect_equal(rctv_strGroupID(), "aaaa")
      expect_equal(rctv_strGroupSubset(), "red")
    }
  )
})

test_that("mod_GroupOverview_Server passes group subset info around", {
  testServer(
    mod_GroupOverview_Server,
    args = list(
      id = "test_id",
      dfResults = gsm.kri::FilterByLatestSnapshotDate(sample_dfResults),
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

test_that("Widget_GroupOverview fails gracefully for bad strGroupLevel", {
  expect_error(
    {
      Widget_GroupOverview(
        id = "test",
        dfResults = sample_dfResults,
        dfMetrics = NULL
      )
    },
    class = "gsm.app-error-missing_strGroupLevel"
  )
})

test_that("Widget_GroupOverview creates a valid HTML widget", {
  widget <- Widget_GroupOverview(
    id = "test",
    sample_dfResults,
    sample_dfMetrics,
    sample_dfGroups
  )
  expect_s3_class(widget, c("WidgetGroupOverview", "htmlwidget"))
})

test_that("Widget_GroupOverview returns expected data", {
  widget <- Widget_GroupOverview(
    id = "test",
    sample_dfResults,
    sample_dfMetrics,
    sample_dfGroups
  )

  expect_named(
    jsonlite::fromJSON(widget$x$dfResults),
    c(
      "GroupID", "GroupLevel", "Numerator", "Denominator", "Metric", "Score",
      "Flag", "MetricID", "SnapshotDate", "StudyID"
    )
  )

  expect_s3_class(jsonlite::fromJSON(widget$x$dfGroups), "data.frame")
  expect_equal(jsonlite::fromJSON(widget$x$strGroupSubset), "red")
})

test_that("Widget_GroupOverview returns correct class", {
  widgetOutput <- Widget_GroupOverviewOutput("test")
  expect_s3_class(widgetOutput, c("shiny.tag.list", "list"))
})

test_that("renderWidget_GroupOverview generates a render function", {
  # The rest of this is tested in the context of the module that wraps it.
  test_result <- renderWidget_GroupOverview({
    Widget_GroupOverviewOutput("test")
  })
  expect_s3_class(test_result, c("shiny.render.function", "function"))
})
