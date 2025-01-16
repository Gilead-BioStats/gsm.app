#' ScatterPlotSet Module Server (Main)
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] with the id of the selected group.
#' @keywords internal
mod_ScatterPlotSet_Server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds,
  rctv_strMetricID,
  rctv_strSiteID
) {
  moduleServer(id, function(input, output, session) {
    lMetricGroups <- purrr::map(
      unique(dfMetrics$MetricID),
      function(strMetricID) {
        # some of these "reactives" aren't really reacting to anything, but we
        # need to create them for the module to get what it's expecting.
        rctv_lMetric <- reactive({
          lMetric <- as.list(filter_byMetricID(dfMetrics, strMetricID))
          strSiteID <- rctv_strSiteID()
          if (strSiteID != "None") {
            lMetric$selectedGroupIDs <- strSiteID
          }
          lMetric
        })
        rctv_dfResults_byMetricID <- reactive({
          filter_byMetricID(dfResults, strMetricID)
        })
        rctv_dfBounds_byMetricID <- reactive({
          filter_byMetricID(dfBounds, strMetricID)
        })

        mod_ScatterPlot_Server(
          strMetricID,
          rctv_dfResults = rctv_dfResults_byMetricID,
          rctv_lMetric = rctv_lMetric,
          dfGroups = dfGroups,
          rctv_dfBounds = rctv_dfBounds_byMetricID,
          rctv_strSiteID = rctv_strSiteID
        )
      }
    )
    rctv_strSelectedMetricID <- reactive({
      req(input$selectedScatterPlot)
      un_ns(input$selectedScatterPlot, session$ns)
    })
    shiny::observe({
      rctv_strMetricID(rctv_strSelectedMetricID())
    }) %>%
      shiny::bindEvent(rctv_strSelectedMetricID())
  })
}
