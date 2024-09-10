#' Initialize Participant Select
#'
#' @inheritParams shared-params
#'
#' @keywords internal
srvr_PopulateParticipantSelect <- function(
    dfAnalyticsInput,
    session = getDefaultReactiveDomain()
) {
  participant_ids <- sort(unique(dfAnalyticsInput$SubjectID))
  updateSelectizeInput(
    "participant",
    choices = c("None", participant_ids),
    selected = "None",
    server = TRUE,
    session = session
  )
}
