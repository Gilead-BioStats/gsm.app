modScatterServer <- function(
    id,
    dfResults,
    dfMetrics,
    dfGroups,
    dfBounds,
    site) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      output$all_charts <- renderUI({
        div(
          class = "row",
          purrr::map(unique(dfMetrics$MetricID), function(x) {
            lMetric <- dfMetrics %>%
              dplyr::filter(.data$MetricID == x) %>%
              as.list()
            dfResultsSubSelect <- dplyr::filter(dfResults, .data$MetricID == x)
            dfBoundsSubSelect <- dplyr::filter(dfBounds, .data$MetricID == x)

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
                        dfResultsSubSelect,
                        lMetric = lMetric,
                        dfGroups = dfGroups,
                        dfBounds = dfBoundsSubSelect,
                        bAddGroupSelect = FALSE,
                        bDebug = FALSE
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
