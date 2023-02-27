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

    domains <- unique(meta$domain)

    # TODO: use gsm::mapping_domain
    # By default, use domain data from {clindata} as a fallback.
    if (is.null(domain_data)) {
        domain_data <- domains %>%
            purrr::map(function(domain) {
                standard <- 'rawplus'
                domain <- domain %>%
                    sub('SUBJ', 'DM', .) %>%
                    sub('PD', 'PROTDEV', .)

                # TODO: avoid hard-coding standard and manipulating domain names
                if (domain %in% c('dfDATACHG', 'dfDATAENT', 'dfQUERY')) {
                    standard <- 'edc'

                    domain <- domain %>%
                        sub('DATAENT', 'data_entry_lag', .) %>%
                        sub('DATACHG', 'data_change_rate', .) %>%
                        sub('QUERY', 'queries', .)
                }

                do.call(
                    `::`,
                    list(
                        'clindata',
                        paste0(standard, '_', sub('^df', '', domain) %>% tolower)
                    )
                )
            }) %>%
            purrr::set_names(domains)
    }

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

    # TODO: see if workflows (safetyGraphics modules) are reactive
    overview_table_ui <- make_overview_table_ui(
        workflows
    )
    overview_table_server <- make_overview_table_server(
        workflows
    )
    overview_table <- safetyGraphics::prepareChart(list(
        env = 'safetyGraphics',
        label = 'Study Overview',
        name = 'overview_table',
        type = 'module',
        package = 'gsmApp',
        domain = domains,
        workflow = list(
            ui = 'overview_table_ui',
            server = 'overview_table_server'
        ),
        links = list(
            gsm = 'https://github.com/Gilead-BioStats/gsm',
            gsmApp = 'https://github.com/Gilead-BioStats/gsmApp'
        )
    ))

    # Launch app.
    safetyGraphics::safetyGraphicsApp(
        meta = meta,
        domainData = domain_data,
        charts = c(list(overview_table), workflows),
        filterDomain = filter_domain,
        appName = '{gsm} Explorer',
        hexPath = system.file('resources/gsm.png', package = 'gsmApp'),
        homeTabPath = system.file('resources/homeTab.html', package = 'gsmApp'),
        launchBrowser = TRUE
    )
}
