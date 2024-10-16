#' Metric Table Module Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the selected group.
#' @keywords internal
mod_MetricTable_Server <- function(
  id,
  rctv_dfResults,
  dfGroups,
  rctv_strSiteID
) {
  moduleServer(id, function(input, output, session) {
    output$table <- gt::render_gt({
      req(rctv_dfResults())
      tbl <- gsm::Report_MetricTable(
        rctv_dfResults(),
        dfGroups = dfGroups,
        strGroupLevel = "Site"
      )
      # Hack to fix `Enrolled` sorting. See
      # https://github.com/Gilead-BioStats/gsm/issues/1895
      tbl$`_data`$Enrolled <- as.integer(tbl$`_data`$Enrolled)

      tbl %>%
        gt::opt_interactive(
          use_resizers = TRUE,
          use_highlight = TRUE,
          use_compact_mode = TRUE,
          use_text_wrapping = FALSE,
          use_page_size_select = TRUE
        ) %>%
        gt::tab_options(
          table.background.color = "transparent",
          column_labels.background.color = "transparent"
        ) %>%
        gt::opt_row_striping()
    })

    observe({
      session$sendCustomMessage(
        "gtSetSelectID",
        list(
          id = session$ns("table"),
          selectID = rctv_strSiteID()
        )
      )
    })

    # Reactive value to store the selected row
    selected_row <- reactiveVal("None")

    # Whenever the table changes, re-bind click events.
    observeEvent(rctv_dfResults(), {
      session$sendCustomMessage("gtBindClick", list(id = session$ns("table")))
    })

    # Observe table selections
    observe({
      req(rctv_dfResults())
      if (length(input$table) > 0) {
        selected_row(input$table)
      } else {
        selected_row("None")
      }
    })

    # Return the selected row data
    return(reactive({
      selected_row()
    }))
  })
}
