#' Run App
#'
#' @inheritParams shared-params
#' @export

run_app <- function(dfResults = NULL, dfGroups = NULL, dfMetrics = NULL, dfBounds = NULL, snapshot = NULL) {

    if (is.null(snapshot)) {
        snapshot <- gsmApp::read_snapshot()
    }

    if (is.null(dfResults)) {
        dfResults <- gsm::reportingResults %>%
            filter(SnapshotDate == max(SnapshotDate))
    }

    if (is.null(dfGroups)) {
       dfGroups <- gsm::reportingGroups
    }

    if (is.null(dfMetrics)) {
       dfMetrics <- gsm::reportingMetrics
    }

    if (is.null(dfBounds)) {
        dfBounds <- gsm::reportingBounds %>%
            filter(SnapshotDate == max(.data$SnapshotDate))
    }

    shinyApp(
        ui = ui(),
        server = function(input, output, session) {
            gsmApp::server(input, output, session,
                           dfResults = dfResults,
                           dfGroups = dfGroups,
                           dfMetrics = dfMetrics,
                           dfBounds = dfBounds,
                           snapshot)
        }
    )
}
