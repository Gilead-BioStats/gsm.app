mod_WidgetPlot_Server <- function(
  id,
  fn_Widget,
  fn_WidgetOutput,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_dfBounds,
  ...
) {
  moduleServer(id, function(input, output, session) {
    output$plot <- renderWidgetPlot({
      fn_Widget(
        session$ns("plot"),
        gsm::FilterByLatestSnapshotDate(rctv_dfResults()),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        dfBounds = rctv_dfBounds(),
        ...
      )
    }, fn_WidgetOutput)
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
