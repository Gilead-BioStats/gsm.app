#' Site Details Server
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_SiteDetails_Server <- function(
    id,
    dfMetrics,
    dfGroups,
    dfAnalyticsInput,
    rctv_strSiteID,
    rctv_strMetricID) {
  moduleServer(id, function(input, output, session) {
    observeEvent(
      rctv_strSiteID(),
      {
        if (rctv_strSiteID() == "None") {
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
      taglist_metric_meta_data(dfMetrics, rctv_strMetricID())
    })


    ### Site Metadata
    output$site_metadata_list <- renderUI({
      taglist_site_meta_data(dfGroups, rctv_strSiteID())
    })


    ### Site Participants Table Across Site Selected
    output$participant_table_title <- renderUI({
      h5(
        "Site ",
        rctv_strSiteID(),
        p(
          class = "lead",
          style = "font-size: .75em;",
          "Select a subject below to drill-down"
        )
      )
    })

    output$participants <- DT::renderDT({
      out_ParticipantsBySite(
        dfAnalyticsInput,
        dfMetrics,
        rctv_strSiteID(),
        rctv_strMetricID()
      )
    })
  })
}
