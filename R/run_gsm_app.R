#' Run {safetyGraphics} Application
#'
#' Display {gsm} assessments in the {safetyGraphics} framework, an interactive R Shiny application.
#'
#' @param meta `data.frame` metadata returned by [map_metadata()]
#' @param domain_data `list` named list of data frames required by `assessments`
#' @param assessments `list` list of assessments in the format expected by {safetyGraphics}
#' @param filter_domain `character` name of data frame with which to subset on participant; must be
#' one record per participant
#'
#' @importFrom purrr map
#' @importFrom safetyGraphics safetyGraphicsApp
#'
#' @examples
#' meta <- map_metadata()
#'
#' domains <- unique(meta$domain)
#' domain_data = purrr::map(
#'     domains,
#'     ~get(paste0('rawplus_', .), envir = as.environment('package:clindata'))
#' )
#' names(domain_data) <- domains
#'
#' assessments = domains[domains != 'subj'] %>%
#'     purrr::map(function(domain) {
#'         domain_alt <- toupper(domain)
#'         if (domain == 'consent')
#'             domain_alt = 'Consent'
#'
#'         prepare_assessment(
#'             meta,
#'             list(
#'                 domain_name = domain,
#'                 map_function = paste0(domain_alt, '_Map_Raw'),
#'                 assess_function = paste0(domain_alt, '_Assess')
#'             )
#'         )
#'     })
#' 
#' run_gsm_app(
#'     meta = meta,
#'     domain_data = domain_data,
#'     assessments = assessments,
#'     filter_domain = 'subj'
#' )
#'
#' @export

run_gsm_app <- function(
    meta = map_metadata(),
    assessments = NULL, # get_assessments(),
    domain_data = NULL,
    filter_domain = 'dfSUBJ'
) {
    domains <- unique(meta$domain)

    # Define named list of data frames from {clindata}.
    if (is.null(domain_data)) {
        domain_data <- purrr::map(
            domains,
            ~get(paste0('rawplus_', sub('^df', '', .) %>% tolower), envir = as.environment('package:clindata'))
        )
        names(domain_data) <- domains
    }

    # Define one assessment per data domain.
    if (is.null(assessments)) {
        assessments <- domains[domains != 'dfSUBJ'] %>%
            purrr::map(function(domain) {
                domain_alt <- sub('^df', '', domain)

                prepare_assessment(domain_alt)
            })
    }

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
