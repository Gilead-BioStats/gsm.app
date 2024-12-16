#' ScatterPlot Module Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the selected group.
#' @keywords internal
mod_ScatterPlot_Server <- function(
  id,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_dfBounds
) {
  mod_WidgetPlot_Server(
    id,
    fn_Widget = Widget_ScatterPlot,
    fn_WidgetOutput = Widget_ScatterPlotOutput,
    rctv_dfResults = rctv_dfResults,
    rctv_lMetric = rctv_lMetric,
    dfGroups = dfGroups,
    rctv_dfBounds = rctv_dfBounds
  )
}
