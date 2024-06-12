#' Metric Details UI
#'
#' @param id The namespace id
#'
#' @export

metric_details_ui <- function(id) {
    ns <- shiny::NS(id)

    ui <- div(
        class = 'row',
        div(
            class = 'col-12 col-sm-12 col-md-12 col-lg-12 col-xxl-9',
            shiny::tabsetPanel(
                shiny::tabPanel(
                    'Scatter Plot',
                    div(
                        class = 'card mb-3',
                        style = 'border-top: solid #0dcaf0; margin-top: 4px;',
                        div(
                            class = 'card-body',
                            gsm::Widget_ScatterPlotOutput(ns('scatter_plot'))
                        )
                    )
                ),
                shiny::tabPanel(
                    'Bar Chart (KRI Value)',
                    div(
                        class = 'card mb-3',
                        style = 'border-top: solid #0dcaf0; margin-top: 4px;',
                        div(
                            class = 'card-body',
                            gsm::Widget_BarChartOutput(ns('bar_chart_metric'))
                        )
                    )
                ),
                shiny::tabPanel(
                    'Bar Chart (KRI Score)',
                    div(
                        class = 'card mb-3',
                        style = 'border-top: solid #0dcaf0; margin-top: 4px;',
                        div(
                            class = 'card-body',
                            gsm::Widget_BarChartOutput(ns('bar_chart_score'))
                        )
                    )
                ),
                shiny::tabPanel(
                    'Time Series',
                    div(
                        class = 'card mb-3',
                        style = 'border-top: solid #0dcaf0; margin-top: 4px;',
                        div(
                            class = 'card-body',
                            gsm::Widget_TimeSeriesOutput(ns('time_series'))
                        )
                    )
                ),
                shiny::tabPanel(
                    'Analysis Output',
                    div(
                        class = 'card mb-3',
                        style = 'border-top: solid #0dcaf0; margin-top: 4px;',
                        div(
                            class = 'card-body',
                            DT::DTOutput(ns('results'))
                        )
                    )
                ),
                type = 'pills'
            )
        )
    )

    return(ui)
}
