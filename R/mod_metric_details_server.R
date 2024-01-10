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

        ## Render Summary Table
        #output$summaryTable <- renderDataTable({
        #    # DataTables based on filteredData()
        #    req(metric)
        #    datatable(filteredData(), options = list(pageLength = 10))
        #})
    })
}
