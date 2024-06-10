#' Initialize Participant Select
#'
#' @param input Shiny inputs
#' @param output Shiny outputs
#' @param session Shiny session
#' @param snapshot The snapshot `list` object passed from `run_app()`
#'
#' @export

initialize_participant_select <- function(input, output, session, snapshot) {
    participant_metadata <- snapshot$lInputs$lData$dfSUBJ %>%
        dplyr::filter(
            .data[[snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
        ) %>%
        dplyr::arrange(
            .data[[snapshot$lInputs$lMapping$dfSUBJ$strIDCol]]
        )

    choices <- participant_metadata[[snapshot$lInputs$lMapping$dfSUBJ$strIDCol]]

    shiny::updateSelectizeInput(
        session,
        'participant',
        choices = c(
            'None',
            choices
        ),
        selected = 'None',
        server = TRUE
    )
}
