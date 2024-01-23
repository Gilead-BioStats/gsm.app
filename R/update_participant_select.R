#' Update Participant Select
#'
#' @export

update_participant_select <- function(input, output, session, snapshot) {
    # Update participant input when client-side selection occurs.
    shiny::observeEvent(input$participant, {
        cli::cli_alert_info(
            'Selected participant: {input$participant}'
        )

        shiny::updateSelectInput(
            session,
            'participant',
            selected = input$participant
        )

        #updateTabsetPanel(
        #    session,
        #    'main_panel',
        #    'Participant Details'
        #)
    })

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

