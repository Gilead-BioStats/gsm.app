#' Run the app
#'
#' @description
#' `run_gsm_app()` creates a Shiny app to explore a set of clinical
#' trial data. The app facilitates exploration of the data by allowing the user
#' to click to diver deeper into aspects of the data.
#'
#' `run_sample_gsm_app()` is a thin wrapper around `run_gsm_app()`, using the
#' sample data provided in this package.
#'
#' @inheritParams shared-params
#' @returns An object that represents the app. Printing the object or passing it
#'   to [shiny::runApp()] runs the app.
#' @seealso [sample_dfAnalyticsInput], [sample_dfBounds], [sample_dfGroups],
#'   [sample_dfMetrics], [sample_fnFetchData()], [sample_dfResults]
#' @examplesIf interactive()
#' # Sample app will launch in a new browser window.
#' run_sample_gsm_app()
#' @export
run_gsm_app <- function(
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  fnFetchData,
  fnCountData = ConstructDataCounter(fnFetchData),
  chrDomains = c(
    AE = "Adverse Events",
    DATACHG = "Data Changes",
    DATAENT = "Data Entry",
    ENROLL = "Enrollment",
    LB = "Lab",
    PD = "Protocol Deviations",
    QUERY = "Queries",
    STUDCOMP = "Study Completion",
    SUBJ = "Subject Metadata",
    SDRGCOMP = "Treatment Completion"
  ),
  lPlugins = NULL,
  strTitle = ExtractAppTitle(dfGroups),
  strFavicon = "angles-up",
  strFaviconColor = "#FF5859",
  tagListExtra = NULL,
  fnServer = NULL
) {
  # There's no point launching the app if the data won't work.
  dfAnalyticsInput <- validate_dfAnalyticsInput(dfAnalyticsInput)
  dfBounds <- validate_dfBounds(dfBounds)
  dfGroups <- validate_dfGroups(dfGroups, dfResults)
  dfMetrics <- validate_dfMetrics(dfMetrics)
  dfResults <- validate_dfResults(dfResults)
  lPlugins <- validate_lPlugins(lPlugins)
  chrDomains <- validate_chrDomains(chrDomains, lPlugins)

  # We currently only use site-level data in this app.
  dfAnalyticsInput <- dfAnalyticsInput[dfAnalyticsInput$GroupLevel == "Site", ]
  dfResults <- dfResults[dfResults$GroupLevel == "Site", ]

  shinyApp(
    ui = gsmApp_UI(
      chrDomains = chrDomains,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfResults = dfResults,
      lPlugins = lPlugins,
      strTitle = strTitle,
      strFavicon = strFavicon,
      strFaviconColor = strFaviconColor,
      tagListExtra = tagListExtra
    ),
    server = gsmApp_Server(
      dfAnalyticsInput = dfAnalyticsInput,
      dfBounds = dfBounds,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfResults = dfResults,
      chrDomains = chrDomains,
      fnFetchData = fnFetchData,
      fnCountData = fnCountData,
      lPlugins = lPlugins,
      fnServer = fnServer
    )
  )
}

#' @rdname run_gsm_app
#' @inheritParams shared-params
#' @export
run_sample_gsm_app <- function(
  strFavicon = "angles-up",
  strFaviconColor = "#FF5859"
) { # nocov start
  run_gsm_app(
    dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
    dfBounds = gsm.app::sample_dfBounds,
    dfGroups = gsm.app::sample_dfGroups,
    dfMetrics = gsm.app::sample_dfMetrics,
    dfResults = gsm.app::sample_dfResults,
    fnFetchData = sample_fnFetchData,
    strTitle = "Sample Deep Dive App",
    strFavicon = strFavicon,
    strFaviconColor = strFaviconColor
  )
} # nocov end
