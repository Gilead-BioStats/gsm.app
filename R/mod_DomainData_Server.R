#' Domain Data Server
#'
#' Display a specific (named) table, or a placeholder.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the SubjectID for each row that is
#'   selected. Currently not useful but will be converted to row numbers when we
#'   need it for deeper dives.
#' @keywords internal
mod_DomainData_Server <- function(
  id,
  rctv_dfDomain
) {
  moduleServer(id, function(input, output, session) {
    rctv_tblData <- reactive({
      if (NROW(rctv_dfDomain())) {
        return(rctv_dfDomain())
      }
      dplyr::tibble(SubjectID = character()) # nocov
    })

    rctv_gtObject <- reactive({
      if (!is.null(rctv_dfDomain())) {
        df <- rctv_tblData()
        gtObj <- gt::gt(df) %>%
          out_gtInteractive(selection_mode = "multiple") %>%
          gt::cols_label(
            .list = gsm::MakeParamLabelsList(colnames(df), chrFieldNames)
          ) %>%
          out_gtSmartFmtNumbers(intMaxDecimals = 10L)

        if ("SubjectID" %in% colnames(df)) {
          gtObj <- gt::cols_align(gtObj, "center", "SubjectID") # nocov
        }
        return(gtObj)
      }
      return(out_gtPlaceholder("site or participant"))
    })

    selected_rows <- mod_gtBidirectional_Server(
      "gt",
      rctv_tblData,
      rctv_gtObject,
      # No input causes selection in this table.
      reactive(NULL),
      "nothing",
      strEmpty = "All"
    )

    return(selected_rows)
  })
}
