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

test_that("PlotPrevalencePlot generates the expected plot", {
  skip_on_os(c("mac", "linux", "solaris"))
  skip_on_ci()
  df <- CombineDomainData(
    dfStudyPrevalencePlots,
    dfGroupPrevalencePlots,
    dfParticipantPrevalencePlots
  ) %>%
    dplyr::select("VizLevel", "category")
  chrTopValues <- PullTopValues(df, "category")
  dfPrevalence <- PreparePrevalenceCounts(df, "category", chrTopValues)
  test_plot <- PlotPrevalencePlot(dfPrevalence, "category")
  vdiffr::expect_doppelganger("Full sample prevalence plot", test_plot)
})

test_that("mod_PrevalencePlot_Server generates the expected plot", {
  skip_on_os(c("mac", "linux", "solaris"))
  skip_on_ci()
  skip_on_cran()
  df <- CombineDomainData(
    dfStudyPrevalencePlots,
    dfGroupPrevalencePlots,
    dfParticipantPrevalencePlots
  ) %>%
    dplyr::select("VizLevel", "category")
  rctv_dfDomain_Combined <- reactive(df)
  rctv_strCategory <- reactiveVal("category")
  testServer(
    mod_PrevalencePlot_Server,
    args = list(
      rctv_dfDomain_Combined = rctv_dfDomain_Combined,
      rctv_strCategory = rctv_strCategory
    ),
    {
      # We'll see how well this works on GHA.
      expect_snapshot({
        output$plot$src
      })
    }
  )
})
