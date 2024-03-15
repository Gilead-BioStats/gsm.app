#' Metric Details Server
#'
#' @param id The namespace id
#' @param snapshot The snapshot `list` object passed from `run_app()`
#' @param metric The reactive value provided by the metric input from `server`
#' @param site The reactive value provided by the site input from `server`
#'
#' @export

metric_details_server <- function(id, snapshot, metric, site) {
    shiny::moduleServer(id, function(input, output, session) {

        output$scatter_plot <- gsm::renderWidget_ScatterPlot({
            shiny::req(metric())
            snapshot$lCharts[[metric()]]$scatterJS$x$selectedGroupIDs <- site()
            snapshot$lCharts[[metric()]]$scatterJS$x$bHideDropdown <- TRUE
            snapshot$lCharts[[metric()]]$scatterJS$x$siteSelectLabelValue <- ""
            snapshot$lCharts[[metric()]]$scatterJS
        })

        output$bar_chart_score <- gsm::renderWidget_BarChart({
            shiny::req(metric())
            snapshot$lCharts[[metric()]]$barScoreJS$x$selectedGroupIDs <- site()
            snapshot$lCharts[[metric()]]$barScoreJS$x$bHideDropdown <- TRUE
            snapshot$lCharts[[metric()]]$barScoreJS$x$siteSelectLabelValue <- ""
            snapshot$lCharts[[metric()]]$barScoreJS
        })

        output$bar_chart_metric <- gsm::renderWidget_BarChart({
            shiny::req(metric())
            snapshot$lCharts[[metric()]]$barMetricJS$x$selectedGroupIDs <- site()
            snapshot$lCharts[[metric()]]$barMetricJS$x$bHideDropdown <- TRUE
            snapshot$lCharts[[metric()]]$barMetricJS$x$siteSelectLabelValue <- ""
            snapshot$lCharts[[metric()]]$barMetricJS
        })

        output$time_series <- gsm::renderWidget_TimeSeries({
            shiny::req(metric())
            snapshot$lCharts[[metric()]]$timeSeriesContinuousJS$x$selectedGroupIDs <- site()
            snapshot$lCharts[[metric()]]$timeSeriesContinuousJS
        })

        output$results <- DT::renderDT({
            shiny::req(metric())

            sites <- snapshot$lSnapshot$rpt_site_details %>%
                dplyr::select("siteid", "country", "status", "enrolled_participants")

            make_summary_table(
                snapshot$lStudyAssessResults[[metric()]],
                sites
            )
        })
    })
}
