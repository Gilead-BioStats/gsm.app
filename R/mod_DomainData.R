#' Domain Data Tab UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::nav_panel()] with either a placeholder, or a
#'   [gt::gt_output()] table.
#' @keywords internal
mod_DomainData_UI <- function(id, strDomain) {
  ns <- NS(id)
  label <- unname(unlist(gsm::MakeParamLabelsList(strDomain, chrDomainLabels)))
  bslib::nav_panel(
    title = label,
    value = strDomain,
    mod_gtBidirectional_UI(ns("gt"))
  )
}

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
        df <- rctv_tblData()                                              # Tested via UI
        gtObj <- gt::gt(df) %>%                                           # Tested via UI
          out_gtInteractive(selection_mode = "multiple") %>%              # Tested via UI
          gt::cols_label(                                                 # Tested via UI
            .list = gsm::MakeParamLabelsList(colnames(df), chrFieldNames) # Tested via UI
          ) %>%                                                           # Tested via UI
          out_gtSmartFmtNumbers(intMaxDecimals = 10L)                     # Tested via UI

        if ("SubjectID" %in% colnames(df)) {
          gtObj <- gt::cols_align(gtObj, "center", "SubjectID")           # Tested via UI
        }
        return(gtObj)                                                     # Tested via UI
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
