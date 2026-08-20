test_that("PlotPrevalencePlot generates the expected plot", {
  expect_snapshot(mod_PrevalencePlot_UI("test"))
})

test_that("PreparePrevalenceCounts sets up the prevalence df", {
  df <- CombineDomainData(
    dfStudyPrevalencePlots,
    dfGroupPrevalencePlots,
    dfParticipantPrevalencePlots
  ) %>%
    dplyr::select("VizLevel", "category")
  chrTopValues <- PullTopValues(df, "category")
  dfPrevalence <- PreparePrevalenceCounts(df, "category", chrTopValues)
  expect_snapshot({
    dfPrevalence
  })
})

test_that("BuildPrevalenceSpec maps the aesthetics for a horizontal dodge", {
  spec <- BuildPrevalenceSpec("category")
  # orientation does not swap x and y: x stays the category aesthetic.
  expect_identical(spec$mapping$x, "VizCategory")
  expect_identical(spec$mapping$y, "pct")
  expect_identical(spec$mapping$fill, "VizLevel")
  expect_identical(spec$orientation, "horizontal")
  # pct is computed within each VizLevel, so each series already sums to 1;
  # stacking would be meaningless and dodge is the only faithful port.
  expect_identical(spec$position, "dodge")
  # The data arrives pre-aggregated from PreparePrevalenceCounts().
  expect_identical(spec$stat, "identity")
})

test_that("BuildPrevalenceSpec preserves the VizLevel palette and its order", {
  spec <- BuildPrevalenceSpec("category")
  # Key order drives series order; gsm.viz ignores scales$fill$order whenever
  # a named colour map is supplied.
  expect_identical(
    names(spec$scales$fill$colors),
    c("Study", "Group", "Participant")
  )
  expect_identical(
    unlist(unname(spec$scales$fill$colors)),
    c("#1b9e77", "#d95f02", "#7570b3")
  )
})

test_that("BuildPrevalenceSpec labels both axes and suppresses the legend caption", {
  spec <- BuildPrevalenceSpec("category")
  expect_identical(spec$scales$y$label, "% of rows")
  expect_identical(
    spec$scales$x$label,
    MakeParamLabelsChr("category", chrFieldNames)
  )
  # An unset fill label prints the raw column name ("VizLevel") as a caption.
  expect_identical(spec$scales$fill$label, "")
})

test_that("BuildPrevalenceSpec formats the y-axis ticks and segment labels as percentages", {
  spec <- BuildPrevalenceSpec("category")
  expect_identical(spec$scales$y$ticks$format, ".0%")
  expect_identical(spec$annotations$labels$segment$format, ".0%")
  # `formatter` is a distinct key (JS function or {token} template) that
  # gsm.viz emits verbatim when it has no {tokens} -- confirm it's gone, not
  # just shadowed by the new `format` key.
  expect_null(spec$annotations$labels$segment$formatter)
})

test_that("BuildPrevalenceSpec keeps the chart non-interactive", {
  spec <- BuildPrevalenceSpec("category")
  expect_null(spec$callbacks)
  expect_null(spec$selection)
})

test_that("PlotPrevalencePlot returns a bars htmlwidget", {
  df <- CombineDomainData(
    dfStudyPrevalencePlots,
    dfGroupPrevalencePlots,
    dfParticipantPrevalencePlots
  ) %>%
    dplyr::select("VizLevel", "category")
  dfPrevalence <- PreparePrevalenceCounts(
    df,
    "category",
    PullTopValues(df, "category")
  )
  test_result <- PlotPrevalencePlot(dfPrevalence, "category")
  expect_s3_class(test_result, "htmlwidget")
  expect_identical(attr(test_result, "package"), "gsm.vizr")
})

test_that("PreparePrevalenceCounts no longer emits the ggplot identity column", {
  # fill_color existed solely to feed scale_fill_identity(); fill = VizLevel
  # carries the mapping now.
  df <- CombineDomainData(
    dfStudyPrevalencePlots,
    dfGroupPrevalencePlots,
    dfParticipantPrevalencePlots
  ) %>%
    dplyr::select("VizLevel", "category")
  dfPrevalence <- PreparePrevalenceCounts(
    df,
    "category",
    PullTopValues(df, "category")
  )
  expect_false("fill_color" %in% colnames(dfPrevalence))
  expect_setequal(
    colnames(dfPrevalence),
    c("VizLevel", "VizCategory", "n", "pct")
  )
})
