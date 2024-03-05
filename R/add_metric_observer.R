#' Add Metric Observer
#'
#' @param snapshot The snapshot `list` object that is passed on from `run_app()`
#' @param metric A reactive value of the metric input found in the `ui` function.
#'
#' @export

add_metric_observer <- function(snapshot, metric) {
    shiny::observeEvent(metric(), {
        metadata <- snapshot$lInputs$lMeta$meta_workflow %>%
            dplyr::filter(
                .data$workflowid == metric()
            ) %>%
            as.list()

        # Highlight column of selected metric.
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
                '        cell.classList.remove("selected-metric");',
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
                'th.classList.toggle("selected-metric");',
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
                '    td.classList.toggle("selected-metric");',
                '});'
            ),
            collapse = '\n'
        )

        if (metric() != 'None') {
            #cli::cli_alert_info(
            #    'Custom JS:'
            #)
            #cat(code)

            shinyjs::runjs(code)
        }
    })
}
