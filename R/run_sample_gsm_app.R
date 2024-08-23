#' Run the App with Sample Data
#'
#' Launch a version of the Shiny app built by this package, using sample data.
#'
#' @return An object that represents the app. Printing the object or passing it
#'   to [shiny::runApp()] will run the app.
#' @export
#'
#' @examplesIf interactive()
#' run_sample_gsm_app()
run_sample_gsm_app <- function() {
  run_gsm_app(
    dfResults = gsm.app::sample_dfResults,
    dfGroups = gsm.app::sample_dfGroups,
    dfMetrics = gsm.app::sample_dfMetrics,
    dfBounds = gsm.app::sample_dfBounds,
    dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
    fnFetchParticipantData = gsm.app::sample_FetchParticipantData
  )
}
