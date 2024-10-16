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

    # Reactive value to store the selected row
    selected_row <- reactiveVal(NULL)

    ns <- session$ns
    observeEvent(
      rctv_dfResults(), {
        session$sendCustomMessage("bindGTClick", list(ns = ns("table")))
      }
    )

    # Observe table selections
    observeEvent(input$table, {
      req(rctv_dfResults())
      if (length(input$table) > 0) {
        cli::cli_inform("Clicked: {input$table}")
        row_data <- rctv_dfResults()$GroupID[[input$table]]
        cli::cli_inform(row_data)
        selected_row(row_data)
      } else {
        selected_row(NULL)
      }
    })

    # Return the selected row data
    return(reactive({ selected_row() }))
  })
}
