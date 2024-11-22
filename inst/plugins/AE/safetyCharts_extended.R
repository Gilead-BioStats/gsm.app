SCWidgetOutput <- function(id, strWidgetName) {
  htmlwidgets::shinyWidgetOutput(
    id,
    name = strWidgetName,
    width = "100%",
    height = "100%",
    package = "safetyCharts"
  )
}

shinyRenderSCWidget <- function(expr, env, fnWidgetOutput) {
  htmlwidgets::shinyRenderWidget(
    expr,
    fnWidgetOutput,
    env,
    quoted = TRUE,
    cacheHint = NULL
  )
}

render_SC_widget <- function(lData, lSettings, fnInit, strWidgetName) {
  initialized <- fnInit(lData, lSettings)
  safetyCharts::render_widget(
    strWidgetName,
    initialized$data,
    initialized$settings
  )
}

aeExplorerOutput <- function(id) {
  SCWidgetOutput(id, "aeExplorer")
}

render_aeExplorer <- function(expr, env = parent.frame()) {
  shinyRenderSCWidget(substitute(expr), env, aeExplorerOutput)
}

aeTimelinesOutput <- function(id) {
  SCWidgetOutput(id, "aeTimelines")
}

render_aeTimelines <- function(expr, env = parent.frame()) {
  shinyRenderSCWidget(substitute(expr), env, aeTimelinesOutput)
}
