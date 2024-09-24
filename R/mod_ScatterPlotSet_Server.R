mod_ScatterPlotSet_Server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds,
  rctv_strSiteID) {
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
          strInputID = "group"
        )
      }
    )

    rval_strSelectedGroup <- reactiveVal()
    purrr::walk(
      lMetricGroups,
      function(rctv_strMetricGroup) {
        bindEvent(
          observe(rval_strSelectedGroup(rctv_strMetricGroup())),
          rctv_strMetricGroup()
        )
      }
    )

    return(rval_strSelectedGroup)
  })
}

mod_ScatterPlotSet_Server_MetricID <- function(id) {
  moduleServer(id, function(input, output, session) {
    rctv_strSelectectMetricID <- reactive({
      req(input$selectedScatterPlot)
      un_ns(input$selectedScatterPlot, session$ns)
    })
    return(rctv_strSelectectMetricID)
  })
}
