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
  rctv_strSite,
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
      if (rctv_strSite() != "None") {
        lMetric$selectedGroupIDs <- rctv_strSite()
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

    observeEvent(rctv_strSite(), {

      if (rctv_strSite() != "None") {

        shinyjs::runjs(sprintf("

            var tableAll = document.getElementById('metric_details-results').querySelectorAll('table');
            tableAll.forEach(function(x) {
              x.classList.remove('table-striped');
            });

            var highlightRow = document.querySelectorAll('table tbody tr');
            highlightRow.forEach(function(row) {
                var groupCell = row.querySelector('td:first-child')
                var cellText = groupCell.textContent.trim().replace(/ \\(.*\\)$/, '')
                if (cellText === '%s') {
                  row.classList.add('table-primary');
                  row.classList.remove('table-deemphasize');
                } else {
                  row.classList.add('table-deemphasize');
                  row.classList.remove('table-primary');
                }

            });", rctv_strSite()))

      } else {

        shinyjs::runjs("

          var tableAll = document.getElementById('metric_details-results').querySelectorAll('table');
          tableAll.forEach(function(x) {
            x.classList.add('table-striped');
          });


          var highlightRow = document.querySelectorAll('table tbody tr');
          highlightRow.forEach(function(row) {
                  row.classList.remove('table-deemphasize');
                  row.classList.remove('table-primary');

          })
                       ")

      }

    })

    shinyjs::runjs("
  document.getElementById('metric_details-results').addEventListener('click', function(event) {
    var target = event.target;
    while (target && target.tagName !== 'TR') {
      target = target.parentElement;
    }

    if (target && target.tagName === 'TR') {
      var firstColumnValue = target.querySelector('td:first-child').textContent.trim().replace(/ \\(.*\\)$/, '');

      Shiny.setInputValue('site', firstColumnValue, { priority: 'event' });
    }
  });
  ")

  })
}
