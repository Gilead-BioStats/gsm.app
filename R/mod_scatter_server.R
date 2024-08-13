mod_scatter_server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      output$all_charts <- renderUI({
        div(
          class = "row",
          purrr::map(unique(dfMetrics$MetricID), function(strMetricID) {
            div(
              class = "col-12 col-sm-12 col-md-12 col-lg-6 col-xxl-4",
              div(
                class = "card mb-3",
                style = "border-top: solid #0dcaf0;",
                div(
                  class = "card-body",
                  tags$div(
                    class = "chart",
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
            )
          })
        )
      })
    }
  )
}
