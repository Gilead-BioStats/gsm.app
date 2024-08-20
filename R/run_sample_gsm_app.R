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
    dfResults = gsm::reportingResults %>%
      FilterByLatestSnapshotDate(),
    dfGroups = gsm::reportingGroups,
    dfMetrics = gsm::reportingMetrics,
    dfBounds = gsm::reportingBounds %>%
      FilterByLatestSnapshotDate(),
    dfAnalyticsInput = gsm::analyticsInput
  )
}
