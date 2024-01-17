server <- function(input, output, session, snapshot) {
    # Study
    observeEvent(input$metric, {
        metadata <- snapshot$lInputs$lMeta$meta_workflow %>%
            filter(
                .data$workflowid == input$metric
            ) %>%
            as.list()

        # TODO: de-highlight previous KRI
        code <- paste(
            c(
                "const table = document",
                "    .getElementById('study_overview-site_overview_table')",
                "    .getElementsByTagName('table')[0];",
                "console.log(table);",
                "",
                paste0(
                    "const th = table.querySelector('[aria-label=\"",
                    metadata$abbreviation,
                    "\"]');"
                ),
                "console.log(th);",
                "th.classList.toggle('the-chosen-one');"
                #"",
                #"const getChildIndex = function(node) {",
                #"    return Array.prototype.indexOf.call(node.parentNode.childNodes, node);",
                #"}",
                #"",
                #"const columnIndex = getChildIndex(th);",
                #"console.log(columnIndex);",
                #"",
                #"const column = table.getElementsBy
            ),
            collapse = '\n'
        )

        if (input$metric != 'None') {
            cli::cli_alert_info(
                'Custom JS:\n'
            )

            shinyjs::runjs(code)

        }

        #updateTabsetPanel(
        #    session,
        #    'main_panel',
        #    'Metric Details'
        #)
    })
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
