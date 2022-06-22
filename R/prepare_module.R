prepare_module <- function(
    meta,
    assessment = list(
        domain_name = NULL,
        map_function = NULL,
        assess_function = NULL
    )
) {
    # check meta
    stopifnot(
        '[ meta ] is not a data frame' =
            is.data.frame(meta)
    )

    # check domain name
    stopifnot(
        '[ assessment$domain_name ] is not a character value' =
            is.character(assessment$domain_name)
    )

    domain <- assessment$domain_name
    domain_alt <- domain
    if (domain_alt == 'CONSENT')
        domain_alt = 'Consent'
    domain_lower <- sub('^df', '', domain) %>% tolower

    # check map function
    stopifnot(
        #'[ assessment$map_function ] is not a function' =
        #    is.function(assessment$map_function),
        '[ assessment$map_function ] is in {gsm} namespace' =
            assessment$map_function %in% as.character(lsf.str('package:gsm'))
    )

    # check assess function
    stopifnot(
        #'[ assessment$assess_function ] is not a function' =
        #    is.function(assessment$assess_function),
        '[ assessment$assess_function ] is in {gsm} namespace' =
            assessment$assess_function %in% as.character(lsf.str('package:gsm'))
    )

    chart_function <- paste0('run_', domain_lower, '_assessment')
    chart_name <- paste0(domain_lower, '_assessment')

    # Define chart object.
    assessment_sg <- list(
        env = "safetyGraphics",
        name = chart_name,
        label = paste0(domain_alt, " Assessment"),
        type = "plot",
        domain = c('dfSUBJ', domain),
        workflow = list(
            main = chart_function
        ),
        meta = meta
    )

    # TODO: Use workflow label
    assessment_yaml <- glue::glue('
        env: safetyGraphics
        label: {domain_alt} Assessment - Module
        name: {chart_name}
        type: module
        package: gsmApp
        domain:
        - dfSUBJ
        - dfAE
        workflow:
          ui: mod_assessment_ui
          server: mod_assessment_server
        links:
          gsm: https://github.com/Gilead-BioStats/gsm
    ')

    assessment <- prepareChart(
        yaml::read_yaml(text = assessment_yaml)
    )
}
