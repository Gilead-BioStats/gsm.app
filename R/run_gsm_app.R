#' Run {safetyGraphics} Application
#'
#' Display {gsm} assessments in the {safetyGraphics} framework, an interactive R Shiny application.
#'
#' @param meta `data.frame` metadata returned by [map_metadata()]
#' @param domainData `list` named list of data frames required by `assessments`
#' @param assessments `list` list of assessments in the format expected by {safetyGraphics}
#' @param filterDomain `character` name of data frame with which to subset on participant; must be
#' one record per participant
#'
#' @importFrom purrr map
#' @importFrom safetyGraphics safetyGraphicsApp
#'
#' @examples
#' meta <- map_metadata()
#'
#' domains <- unique(meta$domain)
#' domainData = purrr::map(
#'     domains,
#'     ~get(paste0('rawplus_', .), envir = as.environment('package:clindata'))
#' )
#' names(domainData) <- domains
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
#'     domainData = domainData,
#'     assessments = assessments,
#'     filterDomain = 'subj'
#' )
#'
#' @export

run_gsm_app <- function(
    meta = map_metadata(),
    domainData = NULL,
    assessments = NULL,
    filterDomain = 'dfSUBJ'
) {
    domains <- unique(meta$domain)

    # Define named list of data frames from {clindata}.
    if (is.null(domainData)) {
        domainData = purrr::map(
            domains,
            ~get(paste0('rawplus_', sub('^df', '', .) %>% tolower), envir = as.environment('package:clindata'))
        )
        names(domainData) <- domains
    }

    # TODO: use {gsm} assesssment workflows here.
    # Define one assessment per data domain.
    if (is.null(assessments)) {
        assessments = domains[domains != 'dfSUBJ'] %>%
            purrr::map(function(domain) {
                domain_alt <- sub('^df', '', domain)
                if (domain_alt == 'CONSENT')
                    domain_alt = 'Consent'

                prepare_assessment(
                    meta,
                    list(
                        domain_name = domain,
                        map_function = paste0(domain_alt, '_Map_Raw'),
                        assess_function = paste0(domain_alt, '_Assess')
                    )
                )
            })
    }

# Modify safetyGraphics YAML with gsm metadata
#ae_assessment_yaml <- '
#env: safetyGraphics
#label: AE Assessment - Module
#name: mod_assessment
#type: module
#package: gsmApp
#domain:
#  - dfSUBJ
#  - dfAE
#workflow:
#  init: init_assessment (apply filterDomain steps)
#  ui: mod_assessment_ui (pass workflow to both UI and server)
#  server: mod_assessment_server > RunAssessment (handles domain subset, )
#links:
#  gsm: https://github.com/Gilead-BioStats/gsm
#'

# - module server
#   - workflow
#   - RunAssessment(workflow)
#   - 

# Modify safetyGraphics YAML with gsm metadata

ae_assessment_yaml <- '
env: safetyGraphics
label: AE Assessment - Module
name: ae_assessment_module
type: module
package: gsmApp
domain:
  - dfSUBJ
  - dfAE
workflow:
  ui: mod_assessment_ui
  server: mod_ae_assessment_server
links:
  gsm: https://github.com/Gilead-BioStats/gsm
'

assessments$ae_assessment_mod <- prepareChart(
    yaml::read_yaml(text = ae_assessment_yaml)
)

pd_assessment_yaml <- '
env: safetyGraphics
label: PD Assessment - Module
name: pd_assessment_module
type: module
package: gsmApp
domain:
  - dfSUBJ
  - dfAE
workflow:
  ui: mod_assessment_ui
  server: mod_pd_assessment_server
links:
  gsm: https://github.com/Gilead-BioStats/gsm
'

assessments$pd_assessment_mod <- prepareChart(
    yaml::read_yaml(text = pd_assessment_yaml)
)

    safetyGraphics::safetyGraphicsApp(
        meta = meta,
        domainData = domainData,
        charts = assessments,
        filterDomain = filterDomain
    )
}
