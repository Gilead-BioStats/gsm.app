server <- function(input, output, session, snapshot) {
    output$study_overview <- DT::renderDT({
        gsm::Overview_Table(
            snapshot$lStudyAssessResults
        )
    })

    #filteredData <- reactive({
    #    browser()
    #})

    output$scatter_plot <- gsm::renderWidget_ScatterPlot({
        snapshot$lStudyAssessResults[[ input$metric ]]$lResults$lCharts$scatterJS
    })

    output$bar_chart_score <- gsm::renderWidget_BarChart({
        snapshot$lStudyAssessResults[[ input$metric ]]$lResults$lCharts$barScoreJS
    })

    output$bar_chart_metric <- gsm::renderWidget_BarChart({
        snapshot$lStudyAssessResults[[ input$metric ]]$lResults$lCharts$barMetricJS
    })

    ## Render Summary Table
    #output$summaryTable <- renderDataTable({
    #    # DataTables based on filteredData()
    #    datatable(filteredData(), options = list(pageLength = 10))
    #})
 
    ## Reset action
    #observeEvent(input$reset, {
    #    # Code to reset the selections
    #})
}
