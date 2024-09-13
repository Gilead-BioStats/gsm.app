mod_Scatter_Server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds) {
  moduleServer(
    id,
    function(input, output, session) {
      output$all_charts <- renderUI({
        fluidRow(
          purrr::map(unique(dfMetrics$MetricID), function(strMetricID) {
            column(
              width = 6,
              bslib::card(
                full_screen = TRUE,
                class = "chart",
                bslib::card_body(
                  gsm::renderWidget_ScatterPlot({
                    gsm::Widget_ScatterPlot(
                      filter_byMetricID(dfResults, strMetricID),
                      lMetric = as.list(
                        filter_byMetricID(dfMetrics, strMetricID)
                      ),
                      dfGroups = dfGroups,
                      dfBounds = filter_byMetricID(dfBounds, strMetricID),
                      bAddGroupSelect = FALSE,
                      bDebug = FALSE,
                      strShinyGroupSelectID = "site"
                    )
                  })
                )
              )
            )
          })
        )
      })
    }
  )
}
