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

        # output$scatter_plot <- gsm::renderWidget_ScatterPlot({
        #     shiny::req(metric())
        #     snapshot$lCharts[[ metric() ]]$scatterJS
        # })

        output$bar_chart_score <- gsm::renderWidget_BarChart({
            shiny::req(metric())
            snapshot$lCharts[[ metric() ]]$barScoreJS$x$selectedGroupIDs <- site()
            snapshot$lCharts[[ metric() ]]$barScoreJS
        })

        output$bar_chart_metric <- gsm::renderWidget_BarChart({
            shiny::req(metric())
            snapshot$lCharts[[ metric() ]]$barMetricJS$x$selectedGroupIDs <- site()
            snapshot$lCharts[[ metric() ]]$barMetricJS
        })

        output$time_series <- gsm::renderWidget_TimeSeries({
            shiny::req(metric())
            snapshot$lCharts[[ metric() ]]$timeSeriesContinuousJS
        })

        output$results <- DT::renderDT({
            shiny::req(metric())

            sites <- snapshot$lSnapshot$rpt_site_details %>%
                select("siteid", "country", "status", "enrolled_participants")

            make_summary_table(
                snapshot$lStudyAssessResults[[ metric() ]],
                sites
            )

        })
    })
}
