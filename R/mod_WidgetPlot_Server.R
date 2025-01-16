#' Standardized Plot Widgets as Shiny Modules
#'
#' @inheritParams shared-params
#' @param fn_Widget A function that uses [htmlwidgets::createWidget()] to create
#'   a widget.
#' @param fn_WidgetOutput A function that uses
#'   [htmlwidgets::shinyWidgetOutput()] to create the shiny version of a widget.
#' @param ... Additional parameters passed to `fn_Widget`.
#' @keywords internal
mod_WidgetPlot_Server <- function(
  id,
  fn_Widget,
  fn_WidgetOutput,
  rctv_dfResults,
  rctv_lMetric,
  dfGroups,
  rctv_dfBounds,
  rctv_strSiteID,
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
    observe({
      input_val <- input$plot
      if (!is.null(input_val) && input_val != "") {
        rctv_strSiteID(input_val)
      }
    })
  })
}
