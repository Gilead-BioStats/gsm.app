#' Run {safetyGraphics} Application
#'
#' Display {gsm} workflows in the {safetyGraphics} framework, an interactive R Shiny application.
#'
#' @param meta `data.frame` metadata returned by [map_metadata()]
#' @param workflows `list` list of workflows in the format expected by {safetyGraphics}
#' @param domain_data `list` named list of data frames required by `workflows`
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

    domains <- unique(meta$domain)
    domain_data <- get_domain_data(domain_data, domains)

    # Define one module per workflow.
    if (is.null(workflows)) {
        workflows <- system.file('workflow', package = 'gsm') %>%
            list.files('^kri000[12567].yaml$', full.name = TRUE) %>%
            #list.files('^kri\\d{4}\\.yaml$', full.name = TRUE) %>%
            purrr::map(function(workflow_path) {
                workflow_id <- workflow_path %>%
                    tools::file_path_sans_ext() %>%
                    stringr::str_split_1('/') %>%
                    tail(1)

                prepare_workflow(workflow_id, domain_data)
            })
    }

    #overview_table <- prepare_overview_table(workflows, domains)

    # Launch app.
    safetyGraphics::safetyGraphicsApp(
        meta = meta,
        domainData = domain_data,
        charts = workflows,#c(list(overview_table), workflows),
        filterDomain = filter_domain,
        #appName = '{gsm} Explorer',
        #hexPath = system.file('resources/hex.png', package = 'gsmApp'),
        #homeTabPath = system.file('resources/gsm-readme.html', package = 'gsmApp'),
        launchBrowser = TRUE
    )
}
