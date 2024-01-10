server <- function(input, output, session, snapshot) {
    #filteredData <- reactive({
    #    browser()
    #})

    # Study
    study_overview_server('study_overview', snapshot)

    # Metric
    update_metric_select(session, snapshot)
    metric_details_server(
        'metric_details',
        snapshot,
        reactive(input$metric)
    )

    # Site
    update_site_select(session, snapshot)
    site_details_server(
        'site_details',
        snapshot,
        reactive(input$site)
    )

    # Participant
    update_participant_select(session, snapshot)
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
