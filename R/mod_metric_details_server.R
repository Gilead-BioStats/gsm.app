#' Metric Details Server
#'
#' @export

metric_details_server <- function(id, snapshot, metric, site) {
    shiny::moduleServer(id, function(input, output, session) {
        output$scatter_plot <- render_widget_scatter_plot({
            shiny::req(metric())

            if (metric() == 'None')
                return(NULL)

            gsm_output <- snapshot$lStudyAssessResults[[ metric() ]]
            data <- gsm_output$lResults$lData$dfSummary
            config <- snapshot$lInputs$lMeta$meta_workflow %>%
                dplyr::filter(
                    .data$workflowid == metric()
                )
            bounds <- gsm_output$lResults$lData$dfBounds

            widget_scatter_plot(
                data,
                config,
                bounds,
                site()
            )
        })

        output$bar_chart_score <- gsm::renderWidget_BarChart({
            shiny::req(metric())
            snapshot$lCharts[[ metric() ]]$barScoreJS
        })

        output$bar_chart_metric <- gsm::renderWidget_BarChart({
            shiny::req(metric())
            snapshot$lCharts[[ metric() ]]$barMetricJS
        })

        output$results <- DT::renderDT({
            shiny::req(metric())

            DT::datatable(
                data = snapshot$lStudyAssessResults[[ metric() ]]$lResults$lData$dfSummary %>%
                    dplyr::mutate(
                        Metric = round(Metric, 3),
                        Score = round(Score, 2)
                    ) %>%
                    dplyr::arrange(dplyr::desc(abs(.data$Score))),
                options = list(
                    lengthChange = FALSE,
                    paging = FALSE,
                    searching = FALSE
                ),
                rownames = FALSE
            )
        })
    })
}
