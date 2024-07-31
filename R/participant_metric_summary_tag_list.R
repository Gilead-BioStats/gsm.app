#' Creates taglist to summarize participants at a particular site
#'
#' @inheritParams shared-params
#' @param participant A combined data set with the required metrics.
#' @export
#' @keywords internal
participant_metric_summary_tag_list <- function(id, participant, snapshot) {
  req(id)
  req(participant)

  domain_list <- list(
    'dfAE' = 'Adverse Events',
    'dfPD' = 'Protocol Deviations',
    #'dfENROLL' = 'Enrollment',
    'dfSTUDCOMP' = 'Study Disposition',
    'dfSDRGCOMP' = 'Treatment Disposition'
    #'dfQUERY' = 'Queries'
  )

  domain_names <- names(domain_list)

  data_aggregated <- data.frame(
    metric = c(),
    row_count = c()
  )

  for (i in 1:length(domain_names)) {
    data <- get_domain(
      snapshot,
      domain = domain_names[i],
      'strIDCol',
      participant
    )$data

    data_aggregated[i, 'metric'] <- domain_names[i]
    data_aggregated[i, 'row_count'] <- nrow(data)
  }


  tag_return <- domain_names %>%
    purrr::map(function(x) {
      tags$div(
        class = 'col-12',
        style = 'font-weight: 500;',
        tags$div(
          style = 'display: flex; justify-content: space-between;',
          tags$div(
            class = 'card-text',
            style = 'text-align: left; white-space: nowrap;',
            actionLink(
              inputId = paste0(id, x),
              label = domain_list[[x]],
              style = 'color:  var(--bs-secondary);'
            )
          ),
          tags$div(class = 'text-secondary', style = 'border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;'),
          tags$div(
            class = 'card-text',
            style = 'text-align: right; white-space: nowrap;', data_aggregated[data_aggregated$metric == x, 'row_count']
          )
        )
      )
    }) %>%
    tags$div(
      class = 'row p-2'
    ) %>%
    tagList()

  return(tag_return)
}
