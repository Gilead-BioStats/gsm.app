#' Study Overview Server
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_StudyOverview_Server <- function(id,
                                     dfResults,
                                     dfMetrics,
                                     dfGroups,
                                     dfBounds,
                                     rctv_strSiteID) {
  moduleServer(id, function(input, output, session) {
    output$site_overview_table <- gsm::renderWidget_GroupOverview({
      gsm::Widget_GroupOverview(
        dfResults = dfResults,
        dfMetrics = dfMetrics,
        dfGroups = dfGroups,
        strGroupSubset = "all"
      )
    })

    rctv_strSelectedGroup <- mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strSiteID = rctv_strSiteID
    )
    rctv_strSelectectMetricID <- mod_ScatterPlotSet_Server_MetricID("scatter")

    return(
      list(
        rctv_strSelectedGroup = rctv_strSelectedGroup,
        rctv_strSelectectMetricID = rctv_strSelectectMetricID
      )
    )
  })
}
