#' Run App
#'
#' @inheritParams shared-params
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
