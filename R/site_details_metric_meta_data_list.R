#' Creates taglist to summarize participants at a particular site
#' @param combinedData `data.frame` A combined data set with the required metrics.
#' @export
#' @keywords internal

site_details_metric_meta_data_list <- function(config_params = NULL, meta_workflow = NULL) {
    return_tags <- tagList(
        tags$div(
            class = 'col-12',
            style = 'font-weight: 500;',
            tags$div(
                style = 'display: flex; justify-content: space-between;',
                tags$div(
                    class = 'card-text',
                    style = 'text-align: left; white-space: nowrap;', 'Metric Name'
                ),
                tags$div(class = 'text-secondary', style = 'border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;'),
                tags$div(class = 'card-text', style = 'text-align: right; white-space: nowrap;', meta_workflow$metric)
            ),
            tags$div(
                style = 'display: flex; justify-content: space-between;',
                tags$div(
                    class = 'card-text',
                    style = 'text-align: left; white-space: nowrap;', 'Numerator'
                ),
                tags$div(class = 'text-secondary', style = 'border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;'),
                tags$div(class = 'card-text', style = 'text-align: right; white-space: nowrap;', meta_workflow$numerator)
            ),
            tags$div(
                style = 'display: flex; justify-content: space-between;',
                tags$div(
                    class = 'card-text',
                    style = 'text-align: left; white-space: nowrap;', 'Denominator'
                ),
                tags$div(class = 'text-secondary', style = 'border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;'),
                tags$div(class = 'card-text', style = 'text-align: right; white-space: nowrap;', meta_workflow$denominator)
            ),
            tags$div(
                style = 'display: flex; justify-content: space-between;',
                tags$div(
                    class = 'card-text',
                    style = 'text-align: left; white-space: nowrap;', 'Thresholds'
                ),
                tags$div(class = 'text-secondary', style = 'border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;'),
                tags$div(class = 'card-text', style = 'text-align: right; white-space: nowrap;', paste(config_params$value, collapse = ', '))
            ),
        )
    )


    return(return_tags)
}
