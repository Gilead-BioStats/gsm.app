observe_participant_select <- function(participant) {
    # Update participant input when client-side selection occurs.
    shiny::observeEvent(
        participant(),
        {
            cli_alert_info(
                'Selected participant: {participant()}'
            )

            shiny::updateSelectizeInput(
                inputId = 'participant',
                selected = participant()
            )

            # Navigate to participant details when a participant is selected.
            if (participant() != 'None' && participant() != '') {
                bslib::nav_select('primary_nav_bar', 'Participant Details')
            }
        },
        ignoreInit = TRUE
    )
}
