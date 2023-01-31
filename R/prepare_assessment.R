#' Prepare {gsm} Assessment for Ingestion by {safetyGraphics}
#'
#' Define a chart object with the format expected by {safetyGraphics}, including required data
#' domains, the charting function, and relevnat metadata.
#'
#' @param domain `character` name of data domain associated with assessment
#' @param yaml_file `character` file path of .yaml file containing assessment metadata
#' @param meta `data.frame` metadata returned by [map_metadata()]
#' @param workflows `data.frame` metadata returned by [map_metadata()]
#'
#' @importFrom glue glue
#' @importFrom purrr keep map_chr
#' @importFrom safetyGraphics prepareChart
#' @importFrom yaml read_yaml
#'
#' @export

prepare_assessment <- function(
    domain,
    yaml_file = system.file(
        'assessments',
        paste0(tolower(domain), '.yaml'),
        package = 'gsmApp'
    ),
    meta = map_meta_to_safetyGraphics(),
    workflows = get_metadata_from_yaml('workflows')
) {
    stopifnot(
        # type checks
        '[ domain ] is not a character value' = is.character(domain),
        '[ yaml_file ] is not a character value' = is.character(yaml_file),
        '[ meta ] is not a data frame' = is.data.frame(meta),
        '[ workflows ] is not a list' = is.list(workflows),

        # logic checks
        '[ domain ] not found in [ meta ]' = domain %in% sub('^df', '', unique(meta$domain)),
        '[ yaml_file ] does not exist' = file.exists(yaml_file),
        '[ domain ] not found in [ workflows ]' = domain %in% (workflows %>% purrr::map_chr(~.x$assessment))
    )

    domain_alt <- domain
    if (domain_alt == 'CONSENT')
        domain_alt = 'Consent'
    domain_lower <- tolower(domain)
    domain_df <- paste0('df', domain)

    assessment <- yaml::read_yaml(yaml_file)
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
