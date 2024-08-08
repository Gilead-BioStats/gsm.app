#' Metric Details Server
#'
#' @inheritParams shared-params
#'
#' @export
mod_metric_details_server <- function(id,
                                      rctv_lMetricsFiltered,
                                      rctv_dfResultsFiltered,
                                      dfGroups,
                                      rctv_dfBoundsFiltered) {
  shiny::moduleServer(id, function(input, output, session) {


    output$scatter_plot <- gsm::renderWidget_ScatterPlot({

        gsm::Widget_ScatterPlot(
          rctv_dfResultsFiltered(),
          lMetric = rctv_lMetricsFiltered(),
          dfGroups = dfGroups,
          dfBounds = rctv_dfBoundsFiltered(),
          bAddGroupSelect = FALSE,
          strShinyGroupSelectID = "site",
          bDebug = FALSE
        )

    })

    output$bar_chart_score <- gsm::renderWidget_BarChart({

      gsm::Widget_BarChart(
        rctv_dfResultsFiltered(),
        lMetric = rctv_lMetricsFiltered(),
        dfGroups = dfGroups,
        strOutcome = "Score",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site",
        bDebug = FALSE
      )

    })

    output$bar_chart_metric <- gsm::renderWidget_BarChart({

      gsm::Widget_BarChart(
        rctv_dfResultsFiltered(),
        lMetric = rctv_lMetricsFiltered(),
        dfGroups = dfGroups,
        strOutcome = "Metric",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site",
        bDebug = FALSE
      )

    })

    output$time_series <- gsm::renderWidget_TimeSeries({

      gsm::Widget_TimeSeries(
        rctv_dfResultsFiltered(),
        lMetric = rctv_lMetricsFiltered(),
        dfGroups = dfGroups,
        strOutcome = "Score",
        bAddGroupSelect = FALSE,
        strShinyGroupSelectID = "site"
      )

    })

    output$results <- renderUI({

      gsm::Report_MetricTable(
        rctv_dfResultsFiltered() %>% dplyr::select(-all_of(c("GroupLevel", "StudyID", "SnapshotDate"))),
        dfGroups,
        strGroupLevel = "Site"
      ) %>% HTML(.)


    })

  })
}
