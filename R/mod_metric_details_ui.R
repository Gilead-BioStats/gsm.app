metric_details_ui <- function(id) {
    ns <- NS(id)

    ui <- shiny::tabPanel(
        'Metric Details',
        shiny::tabsetPanel(
            shiny::tabPanel(
                'Scatter Plot',
                gsm::Widget_ScatterPlotOutput(ns('scatter_plot'))
            ),
            shiny::tabPanel(
                'Bar Chart (KRI Value)',
                gsm::Widget_BarChartOutput(ns('bar_chart_metric'))
            ),
            shiny::tabPanel(
                'Bar Chart (KRI Score)',
                gsm::Widget_BarChartOutput(ns('bar_chart_score'))
            ),
            shiny::tabPanel(
                'Analysis Output',
                DT::DTOutput(ns('results'))
            )
        )
    )

    return(ui)
}
