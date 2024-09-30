#' Initialize Participant Select
#'
#' @inheritParams shared-params
#' @keywords internal
srvr_InitializeParticipantSelect <- function(
  chrParticipantIDs,
  session = getDefaultReactiveDomain()
) {
  updateSelectizeInput(
    "participant",
    choices = c("None", chrParticipantIDs),
    selected = "None",
    server = TRUE,
    session = session
  )
}
