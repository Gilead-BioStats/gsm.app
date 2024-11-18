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
    strOutcome = "Score",
    rctv_dfBounds = shiny::reactive(NULL)
) {
  moduleServer(id, function(input, output, session) {
    output$plot <- renderWidget_BarChart({
      Widget_BarChart(
        session$ns("plot"),
        gsm::FilterByLatestSnapshotDate(rctv_dfResults()),
        strOutcome = strOutcome,
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        dfBounds = rctv_dfBounds()
      )
    })
    observe({
      lMetric <- rctv_lMetric()
      session$sendCustomMessage(
        type = "updateWidgetPlotGroup",
        message = list(
          id = session$ns("plot"),
          selectedGroupID = lMetric$selectedGroupIDs
        )
      )
    })

    return(
      reactive({
        input_val <- input$plot
        if (is.null(input_val) || input_val == "") {
          return(NULL)
        }
        return(input_val)
      })
    )
  })
}
