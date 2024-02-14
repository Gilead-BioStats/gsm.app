#' Metric Details UI
#'
#' @export

metric_details_ui <- function(id) {
    ns <- shiny::NS(id)

ui <- div(class = "row",
          div(class = "col-12 col-sm-12 col-md-12 col-lg-12 col-xxl-9",
              div(id = ns("card_placeholder_site_metadata_list"),
                  class = "card mb-3",
                  style = "border-top: solid #0dcaf0",
                  div(class = "card-body",
                     shiny::tabPanel(
                        'Metric Details',
                        shiny::tabsetPanel(
                            shiny::tabPanel(
                                'Scatter Plot',
                                widget_scatter_plot_output(ns('scatter_plot'))
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
                                'Time Series',
                                gsm::Widget_TimeSeriesOutput(ns('time_series'))
                            ),
                            shiny::tabPanel(
                                'Analysis Output',
                                DT::DTOutput(ns('results'))
                            )
                        )
                )
              )
      )
          )
)

    return(ui)
}
