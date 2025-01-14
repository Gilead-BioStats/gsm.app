#' Study Overview Server
#'
#' @inheritParams shared-params
#' @returns A named list of [shiny::reactive()] objects, each of which is a
#'   string. `rctv_strSelectedGroupID` identifies the selected group, and
#'   `rctv_strSelectedMetricID` identifies the selected metric (the plot most
#'   recently clicked by the user).
#' @keywords internal
mod_StudyOverview_Server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds,
  rctv_strSiteID,
  rctv_strMetricID
) {
  moduleServer(id, function(input, output, session) {
    rctv_intClickCounter <- shiny::reactiveVal()

    # Update things when the user clicks the GroupOverview table.
    mod_GroupOverview_Server(
      "table",
      dfResults,
      dfMetrics,
      dfGroups,
      rctv_strMetricID,
      rctv_strSiteID
    )

    # Update things when the user clicks a plot.
    mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strSiteID = rctv_strSiteID
    )

    return(
      list(
        rctv_intClickCounter = rctv_intClickCounter
      )
    )
  })
}
