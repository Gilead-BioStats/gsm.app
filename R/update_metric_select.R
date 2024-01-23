#' Update Metric Select
#'
#' @export

update_metric_select <- function(input, output, session, snapshot) {
    workflow_metadata <- snapshot$lInput$lMeta$meta_workflow %>%
        dplyr::filter(
            # Remove inactive workflows.
            .data$workflowid %in% (
                snapshot$lInput$lMeta$config_workflow %>%
                    dplyr::filter(
                        .data$active == TRUE
                    ) %>%
                    dplyr::pull(workflowid)
            ),
            # Remove unevaluated workflows.
            .data$workflowid %in% (
                names(snapshot$lStudyAssessResults)
            )
        ) %>%
        dplyr::mutate(
            # Sort workflows: site KRIs > country KRIs > QTLs.
            group_order = dplyr::case_when(
                substring(.data$workflowid, 1, 3) == 'kri' ~ 0,
                substring(.data$workflowid, 1, 3) == 'cou' ~ 1,
                substring(.data$workflowid, 1, 3) == 'qtl' ~ 2,
                TRUE ~ 3
            )
        ) %>%
        dplyr::arrange(
            .data$group_order, .data$workflowid
        )

    choices <- workflow_metadata$workflowid %>%
        stats::setNames(
            glue::glue(
                '{
                    workflow_metadata$metric
                } ({
                    workflow_metadata$group
                })'
            )
        )

    shiny::updateSelectInput(
        session,
        'metric',
        choices = choices
    )
}
