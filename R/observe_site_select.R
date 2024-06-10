observe_site_select <- function(site) {
    # Update site input when client-side selection occurs.
    shiny::observeEvent(
        site(),
        {
            cli::cli_alert_info(
                'Selected site: {site()}'
            )

            shiny::updateSelectInput(
                inputId = 'site',
                selected = site()
            )

            # Navigate to site details when a site is selected.
            nav_select("primary_nav_bar", "Metric Details")

            # Update list of participants when a site is selected.
            if (site() != "None") {
                participant_metadata <- snapshot$lInputs$lData$dfSUBJ %>%
                    dplyr::filter(
                        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strSiteCol ]] == site()
                    ) %>%
                    dplyr::filter(
                        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol ]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
                    ) %>%
                    dplyr::arrange(
                        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]
                    )

                choices <- participant_metadata[[snapshot$lInputs$lMapping$dfSUBJ$strIDCol]]

                shiny::updateSelectizeInput(
                    inputId = "participant",
                    choices = c(
                        "None",
                        choices
                    ),
                    selected = 'None',
                    server = TRUE
                )
            }
        },
        ignoreInit = TRUE
    )
}
