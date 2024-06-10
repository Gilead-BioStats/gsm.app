observe_site_select <- function(site) {
    # Update site input when client-side selection occurs.
    shiny::observeEvent(site(), ignoreInit = TRUE, {
        cli::cli_alert_info(
            'Selected site: {site()}'
        )

        shiny::updateSelectInput(
            session,
            'site',
            selected = site()
        )

        # if (site() != "None") {
        #  participant_metadata <- snapshot$lInputs$lData$dfSUBJ %>%
        #    dplyr::filter(
        #      .data[[ snapshot$lInputs$lMapping$dfSUBJ$strSiteCol ]] == site()
        #    ) %>%
        #    dplyr::filter(
        #      .data[[ snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol ]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
        #    ) %>%
        #    dplyr::arrange(
        #      .data[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]
        #    )

        # choices <- participant_metadata[[snapshot$lInputs$lMapping$dfSUBJ$strIDCol]]

        # shiny::updateSelectizeInput(
        #  session,
        #  "participant",
        #  choices = c(
        #    "None",
        #    choices
        #  ),
        #  selected = 'None',
        #  server = TRUE
        # )
        # }
        # update_participant_select(input, output, session, snapshot, site())
        # nav_select("primary_nav_bar", "Metric Details")
    })

    # observeEvent(input$site,
    #    {
    #        update_participant_select(input, output, session, snapshot, input$site)
    #        #updateSelectizeInput(session, "participant", selected = "None")
    #        nav_select("primary_nav_bar", "Metric Details")
    #    },
    #    ignoreInit = TRUE
    # )
}
