#' Site Details Server
#'
#' @inheritParams shared-params
#'
#' @export

mod_site_details_server <- function(
    id,
    dfMetrics,
    dfGroups,
    dfAnalyticsInput,
    rctv_strSite,
    rctv_strMetricID) {
  shiny::moduleServer(id, function(input, output, session) {

    observeEvent(
      rctv_strSite(),
      {
        if (rctv_strSite() == "None") {
          ## Show placeholders

          shinyjs::hide("card_site_metadata_list")
          shinyjs::hide("card_participant_status")
          shinyjs::hide("card_participants")
          shinyjs::show("card_placeholder_site_metadata_list")
          shinyjs::show("card_placeholder_participant_status")
          shinyjs::show("card_placeholder_participants")
        } else {
          ## Hide placeholders

          shinyjs::hide("card_placeholder_site_metadata_list")
          shinyjs::hide("card_placeholder_participant_status")
          shinyjs::hide("card_placeholder_participants")
          shinyjs::show("card_site_metadata_list")
          shinyjs::show("card_participant_status")
          shinyjs::show("card_participants")
        }
      },
      ignoreInit = TRUE
    )

    ### Metric Metadata List

    output$metric_metadata_list <- renderUI({

      site_details_metric_meta_data_list(dfMetrics, rctv_strMetricID())
    })


    ### Site Participants Table Across Site Selected

    output$participant_table_title <- renderUI({

        h5("Site ", rctv_strSite(),
           p(class = "lead", style = "font-size: .75em;",
             "Select a subject below to drill-down")
        )

    })

    output$participants <- DT::renderDT({

      table_participants_by_site(dfAnalyticsInput, rctv_strSite(), rctv_strMetricID())

    })


  })
}
