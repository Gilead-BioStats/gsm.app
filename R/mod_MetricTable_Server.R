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
    # Update the widget when the source data changes.
    rctv_tbl <- shiny::reactive({
      gsm::Report_MetricTable(
        rctv_dfResults(),
        dfGroups = dfGroups,
        strGroupLevel = "Site"
      )
    })

    # Extract the data back out of the widget.
    rctv_tblData <- shiny::reactive({
      shiny::req(rctv_tbl())
      tbl <- rctv_tbl()
      if (inherits(tbl, "gt_tbl")) {
        return(tbl$`_data`)
      }
      # Return an empty version of the tibble. This should happen transiently at
      # most, so it's hard to test.
      #
      # nocov start
      tibble::tibble(
        StudyID = character(),
        GroupID = character(),
        MetricID = character(),
        Group = character(),
        SnapshotDate = head(as.Date(1), 0),
        Enrolled = integer(),
        Numerator = numeric(),
        Denominator = numeric(),
        Metric = numeric(),
        Score = numeric(),
        Flag = numeric()
      )
      # nocov end
    })

    # The RV ensures that the selection gets updated when the table
    # re-initializes. I'm trying to figure out if this is a general issue and
    # whether it can be dealt with more elegantly in gt.
    rctv_widget_update <- reactiveVal()

    # Render the table interactively.
    output$table <- gt::render_gt({
      req(rctv_dfResults())
      tbl <- rctv_tbl()
      rctv_widget_update("updating")
      tbl %>%
        gt::opt_interactive(
          use_resizers = TRUE,
          use_highlight = TRUE,
          use_compact_mode = TRUE,
          use_text_wrapping = FALSE,
          use_page_size_select = TRUE,
          selection_mode = "single"
        ) %>%
        gt::tab_options(
          table.background.color = "transparent",
          column_labels.background.color = "transparent"
        ) %>%
        gt::opt_row_striping() %>%
        gt::opt_css(
          "/* Hide the selection column */
           .rt-td-select {
             display: none;
           }

           /* Style for selected rows */
           .rt-tr-selected {
             background-color: black !important;
             color: white;
           }"
        )
    })

    # Reactive value to store the selected row
    selected_row <- reactiveVal(NULL)

    # Observe table selections
    observe({
      req(rctv_tblData())
      tbl_data <- rctv_tblData()
      if (is.null(input$table)) {
        selected_row(NULL)
      } else {
        if (nrow(tbl_data) && !all(input$table == 0)) {
          if (!identical(input$table, selected_row())) {
            selected_row(tbl_data$GroupID[[input$table]])
          }
        } else {
          selected_row("None")
        }
      }
    }) %>%
      shiny::bindEvent(input$table, ignoreInit = TRUE, ignoreNULL = FALSE)

    # Update selections from outside.
    observe({
      req(rctv_strSiteID())
      req(rctv_tblData())
      # We need to "use" this to make sure we always update the selection after
      # the table loads. I'm trying to figure out whether this is something that
      # *can* be fixed at the gt level.
      force(rctv_widget_update())
      gt::gt_update_select(
        "table",
        which(rctv_tblData()$GroupID %in% rctv_strSiteID())
      )
      rctv_widget_update(NULL)
    })

    # Return the selected row data
    return(selected_row)
  })
}
