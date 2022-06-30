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
                    do.call(
                        `::`,
                        list(
                            'clindata',
                            paste0('rawplus_', sub('^df', '', domain) %>% tolower)
                        )
                    )
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

    # Launch app.
    safetyGraphics::safetyGraphicsApp(
        meta = meta,
        domainData = domain_data,
        charts = assessments,
        filterDomain = filter_domain,
        appName = '{gsm} Explorer',
        hexPath = system.file('resources/hex-gsm.png', package = 'gsmApp'),
        homeTabPath = system.file('resources/homeTab.html', package = 'gsmApp'),
        launchBrowser = TRUE
    )
}
