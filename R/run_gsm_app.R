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
    meta = gsmApp::meta_data_frame,#map_meta_to_safetyGraphics(),
    workflows = NULL,
    domain_data = NULL,
    filter_domain = 'dfSUBJ',
    mapping=NULL,
    includeSG=TRUE
) {
    stopifnot(
        '[ meta ] must be a data frame.' = is.data.frame(meta)
    )

    domains <- unique(meta$domain)
    # TODO: merge common subject ID onto all domains
    domain_data <- get_domain_data(domain_data, domains, map_meta_to_list(meta))

    # Define one module per workflow.
    if (is.null(workflows)) {
        workflows <- system.file('workflow', package = 'gsm') %>%
            list.files('^kri\\d{4}\\.yaml$', full.name = TRUE) %>%
            purrr::map(function(workflow_path) {
                workflow_id <- workflow_path %>%
                    tools::file_path_sans_ext() %>%
                    stringr::str_split_1('/') %>%
                    tail(1)

                prepare_workflow(workflow_id, domain_data)
            })
    }

    #Add safetyGraphics charts/meta/data
    if(includeSG){
        #Add safetyGraphics domains
        domain_data$aes <- domain_data$dfAE
        domain_data$labs <- domain_data$dfLB
        domain_data$dm <- domain_data$dfSUBJ

        #add charts
        sgcharts <- safetyGraphics::makeChartConfig()
        workflows <- c(workflows, sgcharts)

        #add metadata 
        sgmeta <- safetyGraphics::makeMeta(sgcharts)
        meta <- bind_rows(
            meta %>% select(-key, -value),
            sgmeta %>% mutate(standard_gsm = "")
        )

        #update domains
        domains <- unique(meta$domain)

        #add default mapping
        sgmapping <- list(
            dm = list(
                id_col = "subjectid", 
                treatment_col = "", 
                treatment_values = list(
                    group1 = "", 
                    group2 = ""
                ), 
                sex_col = "sex", 
                race_col = "race", 
                age_col = "agerep"
            ), 
            aes = list(
                id_col = "subjectid", 
                seq_col = "recordid", 
                stdy_col = "", 
                endy_col = "", 
                term_col = "mdrpt_nsv", 
                bodsys_col = "mdrsoc_nsv", 
                severity_col = "aesev_std_nsv", 
                serious_col = "aeser"
            ), 
            labs = list(
                measure_col = "lbtstnam", 
                measure_values = list(
                    ALT = "ALT (SGPT)", 
                    AST = "AST (SGOT)", 
                    TB = "Total Bilirubin", 
                    ALP = "Alkaline Phosphatase"
                ), 
                id_col = "subjid", 
                value_col = "siresn", 
                normal_col_low = "sinrlo", 
                normal_col_high = "sinrhi", 
                studyday_col = "", 
                visit_col = "visnam", 
                visitn_col = "visnum", 
                unit_col = ""
            )
        )
        mapping <- c(mapping,sgmapping)
    }
    #overview_table <- prepare_overview_table(workflows, domains)

    # Launch app.
    safetyGraphics::safetyGraphicsApp(
        meta = meta %>% filter(.data$domain %in% domains),
        domainData = domain_data,
        #charts = c(list(overview_table), workflows),
        charts = workflows,
        mapping = mapping,
        filterDomain = filter_domain,
        appName = '{gsm} Explorer',
        hexPath = system.file('resources/gsm.png', package = 'gsmApp'),
        homeTabPath = system.file('resources/homeTab.html', package = 'gsmApp'),
        launchBrowser = TRUE
    )
}
