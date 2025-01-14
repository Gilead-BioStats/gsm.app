#' BarChart Module Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the selected group.
#' @keywords internal
mod_BarChart_Server <- function(
  id,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_strSiteID,
  strOutcome = "Score",
  rctv_dfBounds = shiny::reactive(NULL)
) {
  mod_WidgetPlot_Server(
    id,
    fn_Widget = Widget_BarChart,
    fn_WidgetOutput = Widget_BarChartOutput,
    rctv_dfResults = rctv_dfResults,
    rctv_lMetric = rctv_lMetric,
    dfGroups = dfGroups,
    rctv_dfBounds = rctv_dfBounds,
    rctv_strSiteID = rctv_strSiteID,
    strOutcome = strOutcome
  )
}
