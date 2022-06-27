prepare_workflows <- function(
    meta = map_metadata(),
    workflows = NULL
) {
    if (is.null(workflows)) {
        workflows <- gsm::MakeAssessmentList()
    }

    purrr::iwalk(
        workflows,
        function(workflow, key) {
            # Get domain.
            map_step <- workflow$workflow %>%
                purrr::keep(~grepl('_Map', .x$name)) %>%
                unlist(FALSE)

            domain <- map_step$inputs %>% .[. != 'dfSUBJ']
            domain_alt <- sub('^df', '', domain)
            if (domain_alt == 'CONSENT')
                domain_alt = 'Consent'
            domain_lower <- tolower(domain_alt)

            # Get parameters.
            assess_step <- workflow$workflow %>%
                purrr::keep(~grepl('_Assess', .x$name)) %>%
                unlist(FALSE)

            params <- assess_step$params
            print(params)

            assessment <- prepare_assessment(
                meta,
                list(
                    domain_name = domain,
                    map_function = paste0(domain_alt, '_Map_Raw'),
                    assess_function = paste0(domain_alt, '_Assess')
                )
            )

            server <- mod_assessment_server(
                meta,
                list(
                    domain_name = domain,
                    map_function = paste0(domain_alt, '_Map_Raw'),
                    assess_function = paste0(domain_alt, '_Assess')
                )
            )

            #server_name <- glue::glue('mod_{domain_lower}_assessment_server')
            #assign(
            #    server_name,
            #    server,
            #    envir = .GlobalEnv
            #)

            #assessment_yaml <- glue::glue('
            #    env: safetyGraphics
            #    label: {domain_alt} Assessment - Module
            #    name: {domain_lower}_assessment_module
            #    type: module
            #    package: gsmApp
            #    domain:
            #        - dfSUBJ
            #        - {domain}
            #    workflow:
            #        ui: mod_assessment_ui
            #        server: {server_name}
            #    links:
            #        gsm: https://github.com/Gilead-BioStats/gsm
            #')

            #prepareChart(
            #    yaml::read_yaml(text = assessment_yaml)
            #)

        }
    )
}
