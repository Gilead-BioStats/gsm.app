observe_site_select <- function(site, snapshot) {
    # Update site input when client-side selection occurs.
    shiny::observeEvent(
        site(),
        {
            cli_alert_info(
                'Selected site: {site()}'
            )

            shiny::updateSelectInput(
                inputId = 'site',
                selected = site()
            )

            # Navigate to site details when a site is selected.
            bslib::nav_select("primary_nav_bar", "Metric Details")

            # Update list of participants when a site is selected.
            updateSelectizeInput(
                inputId = 'participant',
                selected = 'None',
                choices = c(
                    'None',
                    snapshot$lInputs$lData$dfSUBJ %>%
                        dplyr::filter(
                            site() == 'None' | .data[[ snapshot$lInputs$lMapping$dfSUBJ$strSiteCol ]] == site()
                        ) %>%
                        #dplyr::filter(
                        #    .data[[ snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol ]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
                        #) %>%
                        dplyr::pull(
                            .data[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]
                        ) %>%
                        sort()
                )
            )
        },
        ignoreInit = TRUE
    )
}
