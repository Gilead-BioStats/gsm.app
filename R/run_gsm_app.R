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
    filter_domain = 'dfSUBJ'
) {
    stopifnot(
        '[ meta ] must be a data frame.' = is.data.frame(meta)
    )

    domains <- unique(meta$domain) %>%
        .[. %in% c('dfSUBJ', 'dfAE', 'dfPD')]
    domain_data <- get_domain_data(domain_data, domains)

    # Define one module per workflow.
    if (is.null(workflows)) {
        workflows <- system.file('workflow', package = 'gsm') %>%
            list.files('^kri\\d{4}\\.yaml$', full.name = TRUE) %>%
            #list.files('^kri000[1-4]\\.yaml$', full.name = TRUE) %>%
            purrr::map(function(workflow_path) {
                workflow_id <- workflow_path %>%
                    tools::file_path_sans_ext() %>%
                    stringr::str_split_1('/') %>%
                    tail(1)

                prepare_workflow(workflow_id, domain_data)
            })
    }

    overview_table <- prepare_overview_table(workflows, domains)

    # Launch app.
    safetyGraphics::safetyGraphicsApp(
        meta = meta,
        domainData = domain_data,
        charts = c(list(overview_table), workflows),
        #charts = workflows,
        filterDomain = filter_domain,
        appName = '{gsm} Explorer',
        hexPath = system.file('resources/gsm.png', package = 'gsmApp'),
        homeTabPath = system.file('resources/homeTab.html', package = 'gsmApp'),
        launchBrowser = TRUE
    )
}
