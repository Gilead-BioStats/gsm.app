#' Group Participants UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with a placeholder or a clickable table of group
#'   participants.
#' @keywords internal
mod_GroupParticipants_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    tagTitle = NULL,
    bslib::card_header(
      bslib::card_title(shiny::textOutput(ns("title"), inline = TRUE)),
      uiOutput(ns("subtitle"))
    ),
    mod_gtBidirectional_UI(ns("gt")),
    id = ns("gt_card")
  )
}

#' Group Participants Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] with the id of the participant selected in
#'   the table.
#' @keywords internal
mod_GroupParticipants_Server <- function(
    id,
    rctv_strGroupID,
    rctv_strGroupLevel,
    rctv_strSubjectID,
    rctv_dfAnalyticsInput,
    rctv_lColumnNames
) {
  moduleServer(id, function(input, output, session) {
    rctv_lglGroupIsNone <- reactive({
      strGroupID <- rctv_strGroupID()
      is.null(NullifyEmpty(rctv_strGroupID()))
    }) %>%
      bindCache(rctv_strGroupID())

    output$title <- renderText({
      req(rctv_strGroupLevel())
      if (rctv_lglGroupIsNone()) {
        return(paste(rctv_strGroupLevel(), "Subjects"))
      }
      return(glue::glue("{rctv_strGroupLevel()} {rctv_strGroupID()}"))
    }) %>%
      bindCache(rctv_strGroupLevel(), rctv_strGroupID())
    output$subtitle <- renderUI({
      if (rctv_lglGroupIsNone()) {
        return(NULL)
      }
      return(
        out_CardSubtitle("Click rows for participant details", "fst-italic")
      )
    }) %>%
      bindCache(rctv_lglGroupIsNone())

    rctv_gtObject <- reactive({
      df <- rctv_dfAnalyticsInput()
      if (is.null(df) || !nrow(df)) {
        return(out_gtPlaceholder(tolower(rctv_strGroupLevel())))
      }
      gt::gt(df) %>%
        gt::cols_label(.list = rctv_lColumnNames()) %>%
        gt::fmt_number(columns = "Metric", decimals = 5) %>%
        gt::cols_align("center", columns = "SubjectID") %>%
        out_gtInteractive()
    })
    mod_gtBidirectional_Server(
      "gt",
      rctv_dfAnalyticsInput,
      rctv_gtObject,
      rctv_strSubjectID,
      "SubjectID",
      strEmpty = "All"
    )
  })
}
