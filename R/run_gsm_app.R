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
  fnFetchParticipantData) {
  # We only use site-level data in this app.
  dfResults <- dfResults[dfResults$GroupLevel == "Site", ]
  dfAnalyticsInput <- dfAnalyticsInput[dfAnalyticsInput$GroupLevel == "Site", ]

  shinyApp(
    ui = gsmApp_UI(),
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
