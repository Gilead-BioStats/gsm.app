update_site_select <- function(session, snapshot) {
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
        choices = choices
    )
}

