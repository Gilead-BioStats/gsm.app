#' Initialize Participant Select
#'
#' @inheritParams shared-params
#'
#' @export
initialize_participant_select <- function(dfAnalyticsInput, session) {

  participant_ids <- dfAnalyticsInput %>%
    dplyr::filter(GroupLevel == "siteid") %>%
    dplyr::select("SubjectID") %>%
    dplyr::arrange(.data$SubjectID) %>%
    dplyr::pull("SubjectID")

  shiny::updateSelectizeInput(
    session,
    "participant",
    choices = c("None", participant_ids),
    selected = "None",
    server = TRUE
  )
}
