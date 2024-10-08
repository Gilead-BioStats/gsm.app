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
#'   [sample_dfMetrics], [sample_FetchParticipantData()], [sample_dfResults]
#' @examplesIf interactive()
#' # Sample app will launch in a new browser window.
#' run_sample_gsm_app()
#' @export
run_gsm_app <- function(
  dfResults,
  dfGroups,
  dfMetrics,
  dfBounds,
  dfAnalyticsInput,
  fnFetchParticipantData,
  strTitle = "GSM Deep Dive") {
  # There's no point launching the app if the data won't work.
  dfResults <- validate_dfResults(dfResults)
  dfGroups <- validate_dfGroups(dfGroups)
  dfMetrics <- validate_dfMetrics(dfMetrics)
  dfBounds <- validate_dfBounds(dfBounds)
  dfAnalyticsInput <- validate_dfAnalyticsInput(dfAnalyticsInput)

  # We currently only use site-level data in this app.
  dfResults <- dfResults[dfResults$GroupLevel == "Site", ]
  dfAnalyticsInput <- dfAnalyticsInput[dfAnalyticsInput$GroupLevel == "Site", ]

  shinyApp(
    ui = gsmApp_UI(
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      intNParticipants = length(unique(dfAnalyticsInput$SubjectID)),
      strTitle = strTitle
    ),
    server = gsmApp_Server(
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfBounds = dfBounds,
      dfAnalyticsInput = dfAnalyticsInput,
      fnFetchParticipantData = fnFetchParticipantData
    )
  )
}

#' @rdname run_gsm_app
#' @export
run_sample_gsm_app <- function() { # nocov start
  run_gsm_app(
    dfResults = gsm.app::sample_dfResults,
    dfGroups = gsm.app::sample_dfGroups,
    dfMetrics = gsm.app::sample_dfMetrics,
    dfBounds = gsm.app::sample_dfBounds,
    dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
    fnFetchParticipantData = gsm.app::sample_FetchParticipantData,
    strTitle = "Sample Deep Dive App"
  )
} # nocov end
