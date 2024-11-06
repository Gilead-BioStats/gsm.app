#' Participant Domain Server
#'
#' Display a specific (named) table, or a placeholder.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the SubjectID for each row that is
#'   selected. Currently not useful but will be converted to row numbers when we
#'   need it for deeper dives.
#' @keywords internal
mod_ParticipantDomain_Server <- function(id, rctv_lData, rctv_strName) {
  moduleServer(id, function(input, output, session) {
    rctv_lDataIsValid <- reactive({
      length(rctv_lData()) > 0
    })
    rctv_selectionIsValid <- reactive({
      rctv_lDataIsValid() &&
        length(rctv_strName()) &&
        rctv_strName() %in% names(rctv_lData())
    })
    rctv_tblData <- reactive({
      if (rctv_selectionIsValid()) {
        df <- rctv_lData()[[rctv_strName()]]
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
            .list = gsm::MakeParamLabelsList(colnames(df))
          )
        if ("SubjectID" %in% colnames(df)) {
          gtObj <- gt::cols_align(gtObj, "center", "SubjectID") # nocov
        }
        return(gtObj)
      }
      placeholderText <- "domain"
      if (!rctv_lDataIsValid()) {
        placeholderText <- c("participant", placeholderText)
      }
      return(out_gtPlaceholder(placeholderText))
    })
    selected_row <- mod_gtBidirectional_Server(
      "gt",
      rctv_tblData,
      rctv_gtObject,
      reactive({NULL}), # No input causes selection in this table.
      # In the future we might want this to be dynamic, or to have a version of
      # the module that returns the row number or full row or something.
      "SubjectID"
    )

    output$title <- renderText({
      if (rctv_selectionIsValid()) {
        return(gsm::MakeParamLabelsList(rctv_strName())[[1]])
      }
      return("Participant Domain")
    })
    return(selected_row)
  })
}
