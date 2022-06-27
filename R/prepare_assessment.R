prepare_assessment <- function(
    domain,
    yaml_file = system.file(
        'assessments',
        paste0(tolower(domain), '.yaml'),
        package = 'gsmApp'
    ),
    meta = gsmApp::map_metadata(),
    workflows = gsmApp::get_workflows(),
    assessment = list(
        map_function = NULL,
        assess_function = NULL
    )
) {
    stopifnot(
        '[ meta ] is not a data frame' = is.data.frame(meta),
        '[ domain ] is not a character value' = is.character(domain),
        #glue::glue('[ {domain} ] assessment YAML file not found') = file.exists(yaml),
        '[ {domain} ] assessment YAML file not found' = file.exists(yaml_file),
        #'[ assessment$domain_name ] is not a character value' = is.character(assessment$domain_name),
        '[ assessment$map_function ] is in {gsm} namespace' = assessment$map_function %in% as.character(lsf.str('package:gsm')),
        '[ assessment$assess_function ] is in {gsm} namespace' = assessment$assess_function %in% as.character(lsf.str('package:gsm'))
    )

    domain_alt <- domain
    if (domain_alt == 'CONSENT')
        domain_alt = 'Consent'
    domain_lower <- tolower(domain)
    domain_df <- paste0('df', domain)

    assessment <- yaml::read_yaml(yaml_file)
    # TODO: ensure workflows are found
    assessment$workflows <- purrr::keep(workflows, ~.x$assessment == domain)
    assessment$ui <- make_assessment_ui(assessment)
    assign(glue::glue('{domain_lower}_ui'), assessment$ui, envir = .GlobalEnv)
    assessment$server <- make_assessment_server(assessment)
    assign(glue::glue('{domain_lower}_server'), assessment$server, envir = .GlobalEnv)

    assessment_yaml <- glue::glue('
        env: safetyGraphics
        label: {assessment$label} Assessment
        name: {assessment$name}
        type: module
        package: gsmApp
        domain:
          - dfSUBJ
          - {domain_df}
        workflow:
          ui: {domain_lower}_ui
          server: {domain_lower}_server
        links:
          gsm: https://github.com/Gilead-BioStats/gsm
          gsmApp: https://github.com/Gilead-BioStats/gsmApp
    ')

    prepareChart(
        yaml::read_yaml(text = assessment_yaml)
    )
}
