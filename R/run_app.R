#' Run App
#'
#' @inheritParams shared-params
#' @export

run_app <- function(
    dfResults = NULL,
    dfGroups = NULL,
    dfMetrics = NULL,
    dfBounds = NULL) {
  dfResults <- dfResults %||% gsm::reportingResults %>%
    dplyr::filter(.data$SnapshotDate == max(.data$SnapshotDate))
  dfGroups <- dfGroups %||% gsm::reportingGroups
  dfMetrics <- dfMetrics %||% gsm::reportingMetrics
  dfBounds <- dfBounds %||% gsm::reportingBounds %>%
    dplyr::filter(.data$SnapshotDate == max(.data$SnapshotDate))

  shinyApp(
    ui = ui(),
    server = function(input, output, session) {
      gsmApp::server(input, output, session,
        dfResults = dfResults,
        dfGroups = dfGroups,
        dfMetrics = dfMetrics,
        dfBounds = dfBounds
      )
    }
  )
}
