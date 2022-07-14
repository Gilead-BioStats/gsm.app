#' Run {safetyGraphics} Application
#'
#' Display {gsm} assessments in the {safetyGraphics} framework, an interactive R Shiny application.
#'
#' @param meta `data.frame` metadata returned by [map_metadata()]
#' @param assessments `list` list of assessments in the format expected by {safetyGraphics}
#' @param domain_data `list` named list of data frames required by `assessments`
#' @param filter_domain `character` name of data frame with which to subset on participant; must be
#' one record per participant
#'
#' @importFrom purrr map set_names
#' @importFrom safetyGraphics safetyGraphicsApp
#'
#' @export

run_gsm_app <- function(
    meta = map_meta_to_safetyGraphics(),
    assessments = NULL, # get_assessments(),
    domain_data = NULL,
    filter_domain = 'dfSUBJ'
) {
    domains <- unique(meta$domain)

    # By default, use domain data from {clindata} as a fallback.
    if (is.null(domain_data)) {
        domain_data <- domains %>%
            purrr::map(
                function(domain)
                    if (domain == 'dfDISP') { # TODO: remove hard code for disposition
                        clindata::rawplus_subj
                    } else {
                        do.call(
                            `::`,
                            list(
                                'clindata',
                                paste0('rawplus_', sub('^df', '', domain) %>% tolower)
                            )
                        )
                    }
            ) %>%
            purrr::set_names(domains)
    }

    # Define one assessment per data domain.
    if (is.null(assessments)) {
        assessments <- domains[domains != 'dfSUBJ'] %>%
            purrr::map(function(domain) {
                domain_alt <- sub('^df', '', domain)

                prepare_assessment(domain_alt)
            })
    }

    study_table_yaml <- glue::glue('
        env: safetyGraphics
        label: Study Table
        name: study_table
        type: module
        package: gsmApp
        domain:
          - dfSUBJ
          - dfAE
          - dfPD
          - dfIE
          - dfCONSENT
        workflow:
          ui: study_table_ui
          server: study_table_server
        links:
          gsm: https://github.com/Gilead-BioStats/gsm
          gsmApp: https://github.com/Gilead-BioStats/gsmApp
    ')
    study_table_list <- prepareChart(
        yaml::read_yaml(text = study_table_yaml)
    )

    # Launch app.
    safetyGraphics::safetyGraphicsApp(
        meta = meta,
        domainData = domain_data,
        charts = c(assessments, list(study_table_list)),
        filterDomain = filter_domain,
        appName = '{gsm} Explorer',
        hexPath = system.file('resources/hex-gsm.png', package = 'gsmApp'),
        homeTabPath = system.file('resources/homeTab.html', package = 'gsmApp'),
        launchBrowser = TRUE
    )
}
