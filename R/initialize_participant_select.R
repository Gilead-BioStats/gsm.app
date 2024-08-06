#' Initialize Participant Select
#'
#' @inheritParams shared-params
#'
#' @export
initialize_participant_select <- function(input, output, session, snapshot) {
  participant_metadata <- snapshot$lInputs$lData$dfSUBJ %>%
    dplyr::arrange(
      .data[[snapshot$lInputs$lMapping$dfSUBJ$strIDCol]]
    )

  choices <- participant_metadata[[snapshot$lInputs$lMapping$dfSUBJ$strIDCol]]

  shiny::updateSelectizeInput(
    session,
    "participant",
    choices = c(
      "None",
      choices
    ),
    selected = "None",
    server = TRUE
  )
}
