server <- function(input, output, session, snapshot) {
    # Study
    study_overview_server('study_overview', snapshot)

    # Metric
    update_metric_select(input, output, session, snapshot)
    metric_details_server(
        'metric_details',
        snapshot,
        reactive(input$metric),
        reactive(input$site)
    )

    # Site
    update_site_select(input, output, session, snapshot)
    site_details_server(
        'site_details',
        snapshot,
        reactive(input$site)
    )

    # Participant
    update_participant_select(input, output, session, snapshot)
    participant_details_server(
        'participant_details',
        snapshot,
        reactive(input$participant)
    )

    ## Reset action
    #observeEvent(input$reset, {
    #    # Code to reset the selections
    #})
}
