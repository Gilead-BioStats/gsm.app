update_site_select <- function(input, output, session, snapshot) {
    # Update site input when client-side selection occurs.
    observeEvent(input$site, {
        cli::cli_alert_info(
            'Selected site: {input$site}'
        )

        updateSelectInput(
            session,
            'site',
            selected = input$site
        )
    })

    # Capture list of site IDs.
    site_metadata <- snapshot$lInputs$lMeta$meta_site %>%
        filter(
            .data[[ snapshot$lInputs$lMapping$dfSITE$strSiteCol ]] %in% (
                snapshot$lInputs$lData$dfSUBJ[[
                    snapshot$lInputs$lMapping$dfSUBJ$strSiteCol
                ]] %>% unique() %>% sort()
            )
        ) %>%
        arrange(
            .data[[ snapshot$lInputs$lMapping$dfSITE$strSiteCol ]]
        )

    # Include investigator name in each option.
    choices <- site_metadata[[ snapshot$lInputs$lMapping$dfSITE$strSiteCol ]] %>%
        setNames(
            glue::glue(
                '{
                    site_metadata[[ snapshot$lInputs$lMapping$dfSITE$strSiteCol ]]
                } ({
                    site_metadata[[ snapshot$lInputs$lMapping$dfSITE$strPILastNameCol ]]
                })'
            )
        )

    updateSelectInput(
        session,
        'site',
        choices = c(
            'None',
            choices
        )
    )
}

