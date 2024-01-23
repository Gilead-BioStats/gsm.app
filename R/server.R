#' Define Server
#'
#' @export

server <- function(input, output, session, snapshot) {
    # Study
    shiny::observeEvent(input$metric, {
        metadata <- snapshot$lInputs$lMeta$meta_workflow %>%
            dplyr::filter(
                .data$workflowid == input$metric
            ) %>%
            as.list()

        # TODO: de-highlight previous KRI
        code <- paste(
            c(
                # table
                'const table = document',
                '    .getElementById("study_overview-site_overview_table")',
                '    .getElementsByTagName("table")[0];',
                'console.log(table);',
                '',
                '[].forEach.call(',
                '    table.querySelectorAll("th,td"),',
                '    function(cell) {',
                '        cell.classList.remove("selected-kri");',
                '    }',
                ');',
                '',

                # table header cell
                'const th = table.querySelector("[aria-label=\'' %>%
                    paste0(
                        metadata$abbreviation,
                        '\']");'
                    ),
                'console.log(th);',
                'th.classList.toggle("selected-kri");',
                '',

                # column index
                'const getChildIndex = function(node) {',
                '    return Array.prototype.indexOf.call(node.parentNode.childNodes, node);',
                '}',
                '',
                'const columnIndex = getChildIndex(th);',
                'console.log(columnIndex);',
                '',

                # table body cells
                'const tds = table.querySelectorAll(`tr td:nth-child(${columnIndex + 1})`);',
                'console.log(tds);',
                '',
                '[].forEach.call(tds, function(td) {',
                '    td.classList.toggle("selected-kri");',
                '});'
            ),
            collapse = '\n'
        )

        if (input$metric != 'None') {
            cli::cli_alert_info(
                'Custom JS:'
            )
            cat(code)

            shinyjs::runjs(code)
        }

        #updateTabsetPanel(
        #    session,
        #    'main_panel',
        #    'Metric Details'
        #)
    })
    study_overview_server('study_overview', snapshot)

    # Metric
    update_metric_select(input, output, session, snapshot)
    metric_details_server(
        'metric_details',
        snapshot,
        reactive(input$metric),
        reactive(input$site)
    )

    # Site
    update_site_select(input, output, session, snapshot)
    site_details_server(
        'site_details',
        snapshot,
        shiny::reactive(input$site)
    )

    # Participant
    update_participant_select(input, output, session, snapshot)
    participant_details_server(
        'participant_details',
        snapshot,
        shiny::reactive(input$participant)
    )

    ## Reset action
    #observeEvent(input$reset, {
    #    # Code to reset the selections
    #})
}
