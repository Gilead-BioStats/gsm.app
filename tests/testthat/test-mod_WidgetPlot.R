# gsmDependencies() re-materializes another package's widget YAML as
# htmlDependency objects. These tests pin both the source package and the
# resolved asset set, because a wrong source fails silently at runtime rather
# than at check time.

test_that("gsmDependencies resolves every asset from gsm.vizr", {
  for (widget in c(
    "Widget_BarChart",
    "Widget_ScatterPlot",
    "Widget_TimeSeries",
    "Widget_GroupOverview"
  )) {
    deps <- gsmDependencies(widget)
    expect_gt(length(deps), 0)
    expect_setequal(
      vapply(deps, function(d) d$package, character(1)),
      "gsm.vizr"
    )
  }
})

test_that("gsmDependencies keeps the gsmViz bundle identity stable", {
  # htmltools dedupes by name+version. A different name would put a second
  # Chart.js copy on the page alongside gsm.kri's declaration.
  deps <- gsmDependencies("Widget_BarChart")
  gsmViz <- Filter(function(d) d$name == "gsmViz", deps)[[1]]
  expect_identical(gsmViz$version, "2.4.1")
  expect_identical(gsmViz$script, "index.js")
})

test_that("the gsmViz dependency carries the gsm.viz stylesheet", {
  # gsm.kri declared main.css on GroupOverview only; gsm.vizr normalized all
  # four. This test is the guard for that deliberate behavioural delta.
  for (widget in c(
    "Widget_BarChart",
    "Widget_ScatterPlot",
    "Widget_TimeSeries",
    "Widget_GroupOverview"
  )) {
    deps <- gsmDependencies(widget)
    gsmViz <- Filter(function(d) d$name == "gsmViz", deps)[[1]]
    expect_identical(gsmViz$stylesheet, "main.css")
  }
})

test_that("gsmDependencies drops the excluded control-lib scripts", {
  excludes <- c(
    "addSelectControl",
    "addWidgetControls",
    "clickCallback",
    "getGroups",
    "getCountries"
  )
  expect_identical(
    vapply(
      gsmDependencies("Widget_BarChart", excludes),
      function(d) d$name,
      character(1)
    ),
    c("gsmViz", "addOutcomeSelect")
  )
  expect_identical(
    vapply(
      gsmDependencies("Widget_ScatterPlot", excludes),
      function(d) d$name,
      character(1)
    ),
    "gsmViz"
  )
})
