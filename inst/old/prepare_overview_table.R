# TODO: see if workflows (safetyGraphics modules) are reactives
prepare_overview_table <- function(workflows, domains) {
    overview_table_ui <- make_overview_table_ui(workflows)
    assign(glue::glue('overview_table_ui'), overview_table_ui, envir = .GlobalEnv)

    overview_table_server <- make_overview_table_server(workflows)
    assign(glue::glue('overview_table_server'), overview_table_server, envir = .GlobalEnv)

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

    overview_table
}
