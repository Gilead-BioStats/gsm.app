update_metric_select <- function(session, snapshot) {
    workflow_metadata <- snapshot$lInput$lMeta$meta_workflow %>%
        filter(
            # Remove inactive workflows.
            .data$workflowid %in% (
                snapshot$lInput$lMeta$config_workflow %>%
                    filter(
                        .data$active == TRUE
                    ) %>%
                    pull(workflowid)
            ),
            # Remove unevaluated workflows.
            .data$workflowid %in% (
                names(snapshot$lStudyAssessResults)
            )
        ) %>%
        mutate(
            # Sort workflows: site KRIs > country KRIs > QTLs.
            group_order = case_when(
                substring(.data$workflowid, 1, 3) == 'kri' ~ 0,
                substring(.data$workflowid, 1, 3) == 'cou' ~ 1,
                substring(.data$workflowid, 1, 3) == 'qtl' ~ 2,
                TRUE ~ 3
            )
        ) %>%
        arrange(
            .data$group_order, .data$workflowid
        )

    choices <- workflow_metadata$workflowid %>%
        setNames(
            glue::glue(
                '{
                    workflow_metadata$metric
                } ({
                    workflow_metadata$group
                })'
            )
        )

    updateSelectInput(
        session,
        'metric',
        choices = choices
    )
}
