#' Site Participants UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with a placeholder or a clickable table of site
#'   participants.
#' @keywords internal
mod_SiteParticipants_UI <- function(id) {
  ns <- NS(id)
  bslib::card(
    bslib::card_header(
      bslib::card_title(shiny::textOutput(ns("title"), inline = TRUE)),
      uiOutput(ns("subtitle"))
    ),
    mod_gtBidirectional_UI(ns("gt")),
    full_screen = TRUE,
    id = ns("gt_card")
  )
}

#' Site Participants Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] with the id of the participant selected in
#'   the table.
#' @keywords internal
mod_SiteParticipants_Server <- function(
    id,
    rctv_strGroupID,
    rctv_strSubjectID,
    rctv_dfAnalyticsInput,
    rctv_lColumnNames
) {
  moduleServer(id, function(input, output, session) {
    rctv_lglGroupIsNone <- reactive({
      strGroupID <- rctv_strGroupID()
      is.null(strGroupID) || strGroupID == "None"
    }) %>%
      bindCache(rctv_strGroupID())

    output$title <- renderText({
      if (rctv_lglGroupIsNone()) {
        return("Site Subjects")
      }
      return(glue::glue("Site {rctv_strGroupID()}"))
    }) %>%
      bindCache(rctv_strGroupID())
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
        return(out_gtPlaceholder("site"))
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
