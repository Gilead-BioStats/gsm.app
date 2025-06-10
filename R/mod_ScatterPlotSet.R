#' ScatterPlot Set Module UI
#'
#' @inheritParams shared-params
#' @returns An [htmltools::tagList()] containing a [bslib::layout_column_wrap()]
#'   of plots, and the output of [out_DetectCardClicks()] (the JavaScript
#'   necessary to detect that the plot has been clicked).
#' @keywords internal
mod_ScatterPlotSet_UI <- function(id, dfMetrics) {
  ns <- NS(id)
  plots <- purrr::pmap(
    list(
      strMetricID = dfMetrics$MetricID,
      strMetricName = dfMetrics$Metric,
      strGroupLevel = dfMetrics$GroupLevel
    ),
    function(strMetricID, strMetricName, strGroupLevel) {
      mod_ScatterPlot_UI(
        ns(strMetricID),
        strMetricName,
        strGroupLevel = strGroupLevel
      )
    }
  )
  tagList(
    bslib::layout_column_wrap(id = id, width = 1 / 2, !!!unname(plots)),
    out_DetectCardClicks(id, ns("selectedScatterPlot")),
    htmlDependency_HideOtherGroupLevels()
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
  rctv_strGroupID,
  rctv_strGroupLevel,
  rctv_strMetricID
) {
  moduleServer(id, function(input, output, session) {
    lMetricGroups <- purrr::map(
      unique(dfMetrics$MetricID),
      function(strMetricID) {
        # some of these "reactives" aren't really reacting to anything, but we
        # need to create them for the module to get what it's expecting.
        rctv_lMetric <- reactive({
          lMetric <- as.list(FilterbyMetricID(dfMetrics, strMetricID))
          strGroupID <- NullifyEmpty(rctv_strGroupID())
          lMetric$selectedGroupIDs <- strGroupID %||% lMetric$selectedGroupIDs
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
          rctv_strGroupID = rctv_strGroupID
        )
      }
    )
    rctv_strSelectedMetricID <- reactive({
      req(input$selectedScatterPlot)
      UnNS(input$selectedScatterPlot, session$ns)
    })
    observe({
      rctv_strMetricID(rctv_strSelectedMetricID())
    }) %>%
      bindEvent(rctv_strSelectedMetricID())

    # Hide plots that are NOT for the selected group level.
    observe({
      session$sendCustomMessage("hideOtherGroupLevels", list(
        groupLevel = rctv_strGroupLevel()
      ))
    })
  })
}

#' HideGroupLevel JavaScript
#'
#' Attach `hideOtherGroupLevels.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless of how many
#'   times it is added.
#' @keywords internal
htmlDependency_HideOtherGroupLevels <- function() {
  htmltools::htmlDependency(
    name = "HideOtherGroupLevels",
    version = "0.0.1",
    src = "js",
    package = "gsm.app",
    script = "hideOtherGroupLevels.js"
  )
}
