#' Bidirectional gt Table Selector UI
#'
#' @inheritParams shared-params
#' @returns A [gt::gt_output()] that handles updates from external inputs.
#' @keywords internal
mod_gtBidirectional_UI <- function(id) {
  ns <- NS(id)
  tagList(
    htmlDependency_Stylesheet("gt.css"),
    gt::gt_output(ns("table"))
  )
}

#' Bidirectional gt Table Selector Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] with the id(s) of the field(s) selected in
#'   the table.
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
            selected_value(tbl_data[[strLabel]][input$table])
          }
        } else {
          selected_value(strEmpty)
        }
      }
    }) %>%
      bindEvent(input$table, ignoreInit = TRUE, ignoreNULL = FALSE)

    # Update selections from outside.
    #
    # Only tested in UI tests.
    observe({
      req(rctv_strInput())
      req(rctv_dfData())                                      # Tested via UI
      # We need to "use" this to make sure we always update the selection after
      # the table loads. I'm trying to figure out whether this is something that
      # *can* be fixed at the gt level.
      force(rctv_widget_update())                             # Tested via UI
      gt::gt_update_select(                                   # Tested via UI
        "table",                                              # Tested via UI
        which(rctv_dfData()[[strLabel]] %in% rctv_strInput()) # Tested via UI
      )                                                       # Tested via UI
      rctv_widget_update(NULL)                                # Tested via UI
    })

    # Send the value back out.
    observe({
      strSelectedValue <- selected_value()
      if (!is.null(strSelectedValue) && inherits(rctv_strInput, "reactiveVal")) {
        rctv_strInput(strSelectedValue)
      }
    })

    # Return the selected row data
    return(selected_value)
  })
}
