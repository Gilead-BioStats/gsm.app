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
  rctv_lData,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    strLabel <- unname(unlist(gsm::MakeParamLabelsList(id, chrDomainLabels)))
    strLabel <- gsub(" ", "_", strLabel)
    rctv_lDataIsValid <- reactive({
      length(rctv_lData()) > 0
    })
    rctv_selectionIsValid <- reactive({
      rctv_lDataIsValid() &&
        length(strLabel) &&
        strLabel %in% names(rctv_lData())
    })
    rctv_tblData <- reactive({
      if (rctv_selectionIsValid()) {
        df <- rctv_lData()[[strLabel]]
        return(df)
      }
      dplyr::tibble(SubjectID = character()) # nocov
    })

    rctv_gtObject <- reactive({
      if (rctv_selectionIsValid()) {
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
      return(out_gtPlaceholder("domain"))
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
