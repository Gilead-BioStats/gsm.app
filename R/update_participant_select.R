#' Update Participant Select
#'
#' @export

update_participant_select <- function(input, output, session, snapshot) {
    participant_metadata <- snapshot$lInputs$lData$dfSUBJ %>%
        dplyr::filter(
            .data[[ snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol ]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
        ) %>%
        dplyr::arrange(
            .data[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]
        )

    choices <- participant_metadata[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]

    shiny::updateSelectInput(
        session,
        'participant',
        choices = c(
            'None',
            choices
        )
    )
}

