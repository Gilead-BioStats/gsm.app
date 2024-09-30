#' Site Details Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the most recently selected
#'   participant.
#' @keywords internal
mod_SiteDetails_Server <- function(
  id,
  dfGroups,
  dfAnalyticsInput,
  rctv_strSiteID,
  rctv_strMetricID,
  rctv_lMetric) {
  moduleServer(id, function(input, output, session) {
    chrTargetColumns <- c("SubjectID", "Numerator", "Denominator", "Metric")

    # Cache different filterings of dfAnalyticsInput & related transformations.
    rctv_dfAnalyticsInput_byMetric <- reactive({
      dplyr::filter(
        dfAnalyticsInput,
        .data$MetricID == rctv_strMetricID()
      )
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfAnalyticsInput_byMetric_bySite <- reactive({
      rctv_dfAnalyticsInput_byMetric() %>%
        dplyr::filter(
          .data$GroupLevel == "Site",
          .data$GroupID == rctv_strSiteID()
        ) %>%
        dplyr::arrange(dplyr::desc(.data$Metric)) %>%
        dplyr::select(!!!chrTargetColumns)
    }) %>%
      bindCache(rctv_strMetricID(), rctv_strSiteID())

    rctv_chrColumnNames <- reactive({
      metric_names <- rctv_lMetric()[c("Numerator", "Denominator", "Metric")]
      new_colnames <- rlang::set_names(chrTargetColumns, chrTargetColumns)
      new_colnames[names(metric_names)] <- metric_names
      unname(unlist(new_colnames))
    }) %>%
      bindCache(rctv_strMetricID())

    dfSitesAll <- dfGroups[dfGroups$GroupLevel == "Site", ]
    rctv_lSite <- reactive({
      target_rows <- dfSitesAll$GroupID == rctv_strSiteID()
      rlang::set_names(
        dfSitesAll$Value[target_rows],
        unlist(unname(gsm::MakeParamLabelsList(
          dfSitesAll$Param[target_rows]
        )))
      )
    }) %>%
      bindCache(rctv_strSiteID())

    # This code will be removed in an upcoming update (when these are treated as
    # proper modules).
    #
    # nocov start
    observe({
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
    })
    # nocov end

    ### Site Metadata
    output$site_metadata_list <- renderUI({
      out_MetadataList(
        chrLabels = names(rctv_lSite()),
        chrValues = unname(rctv_lSite())
      )
    })

    ### Site Participants Table Across Site Selected
    output$participant_table_title <- renderText({
      paste("Site", rctv_strSiteID())
    }) %>%
      bindCache(rctv_strSiteID())

    output$participants <- DT::renderDT({
      out_SiteParticipants(
        rctv_dfAnalyticsInput_byMetric_bySite(),
        rctv_chrColumnNames()
      )
    })

    # A module one level deeper should return this.
    return(reactive({
      input[["participants-participant"]]
    }))
  })
}
