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
  rctv_strSiteID
) {
  moduleServer(id, function(input, output, session) {
    dfResults <- gsm::FilterByLatestSnapshotDate(dfResults)
    output$site_overview_table <- gsm::renderWidget_GroupOverview({
      gsm::Widget_GroupOverview(
        dfResults = dfResults,
        dfMetrics = dfMetrics,
        dfGroups = dfGroups,
        strGroupSubset = "all"
      )
    })

    rctv_strSelectedGroupID <- mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strSiteID = rctv_strSiteID
    )

    rctv_strSelectedMetricID <- mod_ScatterPlotSet_Server_MetricID("scatter")

    return(
      list(
        rctv_strSelectedGroupID = rctv_strSelectedGroupID,
        rctv_strSelectedMetricID = rctv_strSelectedMetricID
      )
    )
  })
}
