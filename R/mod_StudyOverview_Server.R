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
    rctv_intClickCounter <- shiny::reactiveVal()

    # Update the selection when the incoming group changes.
    shiny::observe({
      rctv_strSelectedGroupID(rctv_strSiteID())
    })

    # Update things when the user clicks the GroupOverview table.
    l_rctvs_table <- mod_GroupOverview_Server(
      "table",
      dfResults,
      dfMetrics,
      dfGroups
    )
    shiny::observe({
      strGroupID <- l_rctvs_table$rctv_strGroupID()
      if (!is.null(strGroupID)) {
        rctv_strSelectedGroupID(strGroupID)
      }
      strMetricID <- l_rctvs_table$rctv_strMetricID()
      if (!is.null(strMetricID)) {
        rctv_strSelectedMetricID(strMetricID)
      }
      rctv_intClickCounter(l_rctvs_table$rctv_intClickCounter())
    }) %>%
      shiny::bindEvent(l_rctvs_table$rctv_intClickCounter(), ignoreInit = TRUE)

    # Update things when the user clicks a plot.
    rctv_strSelectedGroupID_plot <- mod_ScatterPlotSet_Server(
      "scatter",
      dfResults = dfResults,
      dfMetrics = dfMetrics,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_strSiteID = rctv_strSiteID
    )
    shiny::observe({
      rctv_strSelectedGroupID(rctv_strSelectedGroupID_plot())
    })

    rctv_strSelectedMetricID_plot <- mod_ScatterPlotSet_Server_MetricID("scatter")
    shiny::observe({
      rctv_strSelectedMetricID(rctv_strSelectedMetricID_plot())
    })

    return(
      list(
        rctv_strSelectedGroupID = rctv_strSelectedGroupID,
        rctv_strSelectedMetricID = rctv_strSelectedMetricID,
        rctv_intClickCounter = rctv_intClickCounter
      )
    )
  })
}
