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
    rctv_strSelectedGroupID <- shiny::reactiveVal()
    rctv_strSelectedMetricID <- shiny::reactiveVal()
    shiny::observe({
      rctv_strSelectedGroupID(rctv_strSiteID())
    })
    l_rctvs_table <- mod_GroupOverview_Server(
      "table",
      dfResults,
      dfMetrics,
      dfGroups
    )
    shiny::observe({
      rctv_strSelectedGroupID(
        l_rctvs_table$rctv_strGroupID()
      )
    })
    shiny::observe({
      rctv_strSelectedMetricID(
        l_rctvs_table$rctv_strMetricID()
      )
    })

    rctv_strSelectedGroupID_plot <- mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strSiteID = rctv_strSiteID
    )
    shiny::observe({
      rctv_strSelectedGroupID(
        rctv_strSelectedGroupID_plot()
      )
    })

    rctv_strSelectedMetricID_plot <- mod_ScatterPlotSet_Server_MetricID("scatter")
    shiny::observe({
      rctv_strSelectedMetricID(
        rctv_strSelectedMetricID_plot()
      )
    })

    return(
      list(
        rctv_strSelectedGroupID = rctv_strSelectedGroupID,
        rctv_strSelectedMetricID = rctv_strSelectedMetricID
      )
    )
  })
}
