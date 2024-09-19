mod_ScatterPlot_Server <- function(
    id,
    rctv_dfResults,
    rctv_lMetric,
    dfGroups,
    rctv_dfBounds,
    strInputID
) {
  moduleServer(id, function(input, output, session) {
    output$scatter_plot <- renderWidget_ScatterPlot({
      Widget_ScatterPlot(
        session$ns("scatter_plot"),
        rctv_dfResults(),
        lMetric = rctv_lMetric(),
        dfGroups = dfGroups,
        dfBounds = rctv_dfBounds(),
        strInputID = session$ns(strInputID)
      )
    })
    outputOptions(output, "scatter_plot", suspendWhenHidden = FALSE)

    return(
      reactive({input[[strInputID]]})
    )
  })
}
