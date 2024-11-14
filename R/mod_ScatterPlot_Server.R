#' ScatterPlot Module Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the selected group.
#' @keywords internal
mod_ScatterPlot_Server <- function(
  id,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_dfBounds
) {
  moduleServer(id, function(input, output, session) {
    output$plot <- renderWidget_ScatterPlot({
      Widget_ScatterPlot(
        session$ns("plot"),
        gsm::FilterByLatestSnapshotDate(rctv_dfResults()),
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
