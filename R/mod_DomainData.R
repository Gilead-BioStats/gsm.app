#' Domain Data Tab UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::nav_panel()] with either a placeholder, or a
#'   [gt::gt_output()] table.
#' @keywords internal
mod_DomainData_UI <- function(id, strDomainLabel, strDomainID) {
  ns <- NS(id)
  bslib::nav_panel(
    title = strDomainLabel,
    value = strDomainID,
    out_Card(
      tagTitle = NULL,
      shinycssloaders::withSpinner(
        mod_gtBidirectional_UI(ns("gt")),
        type = 7,
        id = ns("spinner"),
        caption = "loading data...",
        proxy.height = "200px"
      ),
      id = ns("card")
    )
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
  rctv_dfDomain,
  rctv_strDomainHash,
  rctv_strGroupLevel
) {
  moduleServer(id, function(input, output, session) {
    rctv_tblData <- reactive({
      if (NROW(rctv_dfDomain())) {
        return({
          # gt is surprisingly slow with dates and times. Format them as
          # character ahead of time.
          dplyr::mutate(
            rctv_dfDomain(),
            dplyr::across(
              dplyr::where(function(x) {
                inherits(x, "POSIXct") | inherits(x, "Date")
              }),
              as.character
            )
          )
        })
      }
      dplyr::tibble(SubjectID = character()) # nocov
    }) %>%
      bindCache(rctv_strDomainHash())

    rctv_gtObject <- reactive({
      if (!is.null(rctv_dfDomain())) {
        df <- rctv_tblData() # Tested via UI
        gtObj <- gt::gt(df) %>% # Tested via UI
          out_gtInteractive(selection_mode = "multiple") %>% # Tested via UI
          gt::cols_label( # Tested via UI
            .list = gsm.kri::MakeParamLabelsList(colnames(df), chrFieldNames) # Tested via UI
          ) %>% # Tested via UI
          out_gtSmartFmtNumbers(intMaxDecimals = 10L) # Tested via UI

        if ("SubjectID" %in% colnames(df)) {
          gtObj <- gt::cols_align(gtObj, "center", "SubjectID") # Tested via UI
        }
        return(gtObj) # Tested via UI
      }
      return(
        out_gtPlaceholder(
          glue::glue("{tolower(rctv_strGroupLevel())} or participant")
        )
      )
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
