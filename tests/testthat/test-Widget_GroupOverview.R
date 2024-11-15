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
