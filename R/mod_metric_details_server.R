metric_details_server <- function(id, snapshot, metric) {
    moduleServer(id, function(input, output, session) {
        output$scatter_plot <- gsm::renderWidget_ScatterPlot({
            req(metric())
            snapshot$lStudyAssessResults[[ metric() ]]$lResults$lCharts$scatterJS
        })

        output$bar_chart_score <- gsm::renderWidget_BarChart({
            req(metric())
            snapshot$lStudyAssessResults[[ metric() ]]$lResults$lCharts$barScoreJS
        })

        output$bar_chart_metric <- gsm::renderWidget_BarChart({
            req(metric())
            snapshot$lStudyAssessResults[[ metric() ]]$lResults$lCharts$barMetricJS
        })

        output$results <- DT::renderDT({
            req(metric())

            DT::datatable(
                data = snapshot$lStudyAssessResults[[ metric() ]]$lResults$lData$dfSummary %>%
                    mutate(
                        Metric = round(Metric, 3),
                        Score = round(Score, 2)
                    ) %>%
                    arrange(desc(abs(.data$Score))),
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
