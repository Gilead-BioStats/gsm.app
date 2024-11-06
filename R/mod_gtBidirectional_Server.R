#' Bidirectional gt Table Selector Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] with the id of the field selected in the
#'   table.
#' @keywords internal
mod_gtBidirectional_Server <- function(
  id,
  rctv_dfData,
  rctv_gtObject,
  rctv_strInput,
  strLabel,
  strEmpty = "None"
) {
  moduleServer(id, function(input, output, session) {
    # The RV ensures that the selection gets updated when the table
    # re-initializes. I'm trying to figure out if this is a general issue and
    # whether it can be dealt with more elegantly in gt.
    rctv_widget_update <- reactiveVal()
    output$table <- gt::render_gt({
      rctv_widget_update("updating")
      rctv_gtObject()
    })

    # Reactive value to store the selected row
    selected_value <- reactiveVal(NULL)

    # Observe table selections
    observe({
      req(rctv_dfData())
      tbl_data <- rctv_dfData()
      if (is.null(input$table)) {
        selected_value(NULL)
      } else {
        if (nrow(tbl_data) && !all(input$table == 0)) {
          if (!identical(input$table, selected_value())) {
            selected_value(tbl_data[[strLabel]][[input$table]])
          }
        } else {
          selected_value(strEmpty)
        }
      }
    }) %>%
      shiny::bindEvent(input$table, ignoreInit = TRUE, ignoreNULL = FALSE)

    # Update selections from outside.
    #
    # Only tested in UI tests.
    observe({
      req(rctv_strInput())
      req(rctv_dfData())
      # We need to "use" this to make sure we always update the selection after
      # the table loads. I'm trying to figure out whether this is something that
      # *can* be fixed at the gt level.
      force(rctv_widget_update())
      gt::gt_update_select(
        "table",
        which(rctv_dfData()[[strLabel]] %in% rctv_strInput())
      )
      rctv_widget_update(NULL)
    })

    # Return the selected row data
    return(selected_value)
  })
}
