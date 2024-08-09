#' Run App
#'
#' @inheritParams shared-params
#' @param dfResults `data.frame` A stacked summary of analysis pipeline output.
#'   This will be filtered to cases where `GroupLevel == "Site"`.
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

  # We only use site-level data in this app.
  dfResults <- dfResults[dfResults$GroupLevel == "Site", ]

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
