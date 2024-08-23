#' Metric Details Server
#'
#' @inheritParams shared-params
#'
#' @export
mod_metric_details_server <- function(
  id,
  dfResults,
  dfMetrics,
  dfGroups,
  dfBounds,
  rctv_strSiteID,
  rctv_strMetricID) {
  shiny::moduleServer(id, function(input, output, session) {
    # Shared reactives ----
    rctv_dfResults_byMetricID <- reactive({
      filter_byMetricID(dfResults, rctv_strMetricID())
    })
    rctv_lMetric <- reactive({
      lMetric <- as.list(
        filter_byMetricID(dfMetrics, rctv_strMetricID())
      )
      if (rctv_strSiteID() != "None") {
        lMetric$selectedGroupIDs <- rctv_strSiteID()
      }
      lMetric
    })
    rctv_dfBounds_byMetricID <- reactive({
      filter_byMetricID(dfBounds, rctv_strMetricID())
    })

    # Outputs ----
    observeEvent(input$selected_tab, {
      switch(input$selected_tab,
        "Scatter Plot" = {
          output$scatter_plot <- gsm::renderWidget_ScatterPlot({
            gsm::Widget_ScatterPlot(
              rctv_dfResults_byMetricID(),
              lMetric = rctv_lMetric(),
              dfGroups = dfGroups,
              dfBounds = rctv_dfBounds_byMetricID(),
              bAddGroupSelect = FALSE,
              strShinyGroupSelectID = "site"
            )
          })
          outputOptions(output, "scatter_plot", suspendWhenHidden = FALSE)
        },
        "Bar Chart (KRI Value)" = {
          output$bar_chart_metric <- gsm::renderWidget_BarChart({
            gsm::Widget_BarChart(
              rctv_dfResults_byMetricID(),
              lMetric = rctv_lMetric(),
              dfGroups = dfGroups,
              strOutcome = "Metric",
              bAddGroupSelect = FALSE,
              strShinyGroupSelectID = "site"
            )
          })
          outputOptions(output, "bar_chart_metric", suspendWhenHidden = FALSE)
        },
        "Bar Chart (KRI Score)" = {
          output$bar_chart_score <- gsm::renderWidget_BarChart({
            gsm::Widget_BarChart(
              rctv_dfResults_byMetricID(),
              lMetric = rctv_lMetric(),
              dfGroups = dfGroups,
              strOutcome = "Score",
              bAddGroupSelect = FALSE,
              strShinyGroupSelectID = "site"
            )
          })
          outputOptions(output, "bar_chart_score", suspendWhenHidden = FALSE)
        },
        "Time Series" = {
          output$time_series <- gsm::renderWidget_TimeSeries({
            gsm::Widget_TimeSeries(
              rctv_dfResults_byMetricID(),
              lMetric = rctv_lMetric(),
              dfGroups = dfGroups,
              strOutcome = "Score",
              bAddGroupSelect = FALSE,
              strShinyGroupSelectID = "site"
            )
          })
          outputOptions(output, "time_series", suspendWhenHidden = FALSE)
        },
        "Analysis Output" = {
          output$results <- renderUI({
            gsm::Report_MetricTable(
              rctv_dfResults_byMetricID() %>%
                dplyr::arrange("GroupID") %>%
                dplyr::select(
                  -dplyr::all_of(c("GroupLevel", "StudyID", "SnapshotDate"))
                ),
              dfGroups,
              strGroupLevel = "Site"
            ) %>%
              HTML()
          })
          outputOptions(output, "results", suspendWhenHidden = FALSE)
        }
      )
    })

    ### Highlight analysis output table and update site selector
    observeEvent(rctv_strSiteID(), {
      shinyjs::runjs(
        sprintf(
          "highlightTableRow('analysis_output_table', '%s');",
          rctv_strSiteID()
        )
      )
    })

    shinyjs::runjs("tableClick('analysis_output_table');")


  })
}
