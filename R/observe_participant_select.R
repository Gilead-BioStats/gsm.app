observe_participant_select <- function(participant) {
    # Update participant input when client-side selection occurs.
    shiny::observeEvent(participant(), {
        cli::cli_alert_info(
            'Selected participant: {participant()}'
        )

        shiny::updateSelectInput(
            session,
            'participant',
            selected = participant()
        )

        if (participant() != 'None' && participant() != '') {
            nav_select('primary_nav_bar', 'Participant Details')
        }
    })

    # observeEvent(input$participant,
    #    {
    #        if (input$participant != "None" & input$participant != "") {
    #            nav_select("primary_nav_bar", "Participant Details")
    #        }
    #    },
    #    ignoreInit = TRUE
    # )
}
