#' ScatterPlot Set Module UI
#'
#' @inheritParams shared-params
#' @returns An [htmltools::tagList()] containing a [bslib::layout_column_wrap()]
#'   of plots, and the output of [out_DetectCardClicks()] (the JavaScript
#'   necessary to detect that the plot has been clicked).
#' @keywords internal
mod_ScatterPlotSet_UI <- function(id, chrMetrics) {
  ns <- NS(id)
  plots <- purrr::imap(
    chrMetrics,
    function(MetricID, MetricName) {
      mod_ScatterPlot_UI(ns(MetricID), MetricName)
    }
  )
  tagList(
    bslib::layout_column_wrap(id = id, width = 1 / 2, !!!unname(plots)),
    out_DetectCardClicks(id, ns("selectedScatterPlot"))
  )
}

#' ScatterPlotSet Module Server
#'
#' @inheritParams shared-params
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
          lMetric <- as.list(FilterbyMetricID(dfMetrics, strMetricID))
          strSiteID <- rctv_strSiteID()
          if (strSiteID != "None") {
            lMetric$selectedGroupIDs <- strSiteID
          }
          lMetric
        })
        rctv_dfResults_byMetricID <- reactive({
          FilterbyMetricID(dfResults, strMetricID)
        })
        rctv_dfBounds_byMetricID <- reactive({
          FilterbyMetricID(dfBounds, strMetricID)
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
      UnNS(input$selectedScatterPlot, session$ns)
    })
    shiny::observe({
      rctv_strMetricID(rctv_strSelectedMetricID())
    }) %>%
      shiny::bindEvent(rctv_strSelectedMetricID())
  })
}
