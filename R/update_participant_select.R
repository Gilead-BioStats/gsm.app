update_participant_select <- function(session, snapshot) {
    print(names(snapshot$lInputs$lData$dfSUBJ))
    participant_metadata <- snapshot$lInputs$lData$dfSUBJ %>%
        filter(
            .data[[ snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol ]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
        ) %>%
        arrange(
            .data[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]
        )

    choices <- participant_metadata[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]

    updateSelectInput(
        session,
        'participant',
        choices = choices
    )
}

