#' Site Details UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::layout_columns()] with site metadata and site participants.
#' @keywords internal
mod_SiteDetails_UI <- function(id) {
  ns <- NS(id)
  bslib::layout_columns(
    col_widths = c(5, 7),
    tagList(
      # TODO: Replace with a single module. Extra div is temporary to make the
      # hide/show cleaner.
      shinyjs::hidden(
        div(
          id = ns("card_site_metadata_list"),
          out_Card(
            "Site Metadata",
            uiOutput(ns("site_metadata_list")),
            id = ns("card_site_metadata_list-contents")
          )
        )
      ),
      out_Card(
        "Site Metadata",
        out_Placeholder("site"),
        id = ns("card_placeholder_site_metadata_list")
      )
    ),
    mod_SiteParticipants_UI(ns("participants"))
  )
}

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
    rctv_strSubjectID,
    rctv_strMetricID,
    rctv_lMetric) {
  moduleServer(id, function(input, output, session) {
    chrTargetColumns <- c("SubjectID", "Numerator", "Denominator", "Metric")

    # Cache different filterings of dfAnalyticsInput & related transformations.
    rctv_dfAnalyticsInput_byMetric <- reactive({
      req(rctv_strMetricID())
      dplyr::filter(
        dfAnalyticsInput,
        .data$MetricID == rctv_strMetricID()
      )
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfAnalyticsInput_byMetric_bySite <- reactive({
      req(rctv_strMetricID())
      req(rctv_strSiteID())
      rctv_dfAnalyticsInput_byMetric() %>%
        dplyr::filter(
          .data$GroupLevel == "Site",
          .data$GroupID == rctv_strSiteID()
        ) %>%
        dplyr::arrange(dplyr::desc(.data$Metric)) %>%
        dplyr::select(!!!chrTargetColumns)
    }) %>%
      bindCache(rctv_strMetricID(), rctv_strSiteID())

    rctv_lColumnNames <- reactive({
      req(rctv_strMetricID())
      metric_names <- rctv_lMetric()[c("Numerator", "Denominator", "Metric")]
      new_colnames <- rlang::set_names(chrTargetColumns, chrTargetColumns)
      new_colnames[names(metric_names)] <- metric_names
      new_colnames
    }) %>%
      bindCache(rctv_strMetricID())

    dfSitesAll <- dfGroups[dfGroups$GroupLevel == "Site", ]
    rctv_lSite <- reactive({
      req(rctv_strSiteID())
      target_rows <- dfSitesAll$GroupID == rctv_strSiteID()
      rlang::set_names(
        dfSitesAll$Value[target_rows],
        MakeParamLabelsChr(
          dfSitesAll$Param[target_rows]
        )
      )
    }) %>%
      bindCache(rctv_strSiteID())

    # This code will be removed in an upcoming update (when these are treated as
    # proper modules).
    #
    # nocov start
    observe({
      if (rctv_strSiteID() == "All") {
        ## Show placeholders
        shinyjs::hide("card_site_metadata_list")
        shinyjs::show("card_placeholder_site_metadata_list")
      } else {
        ## Hide placeholders
        shinyjs::hide("card_placeholder_site_metadata_list")
        shinyjs::show("card_site_metadata_list")
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
    mod_SiteParticipants_Server(
      "participants",
      rctv_strSiteID,
      rctv_strSubjectID,
      rctv_dfAnalyticsInput_byMetric_bySite,
      rctv_lColumnNames
    )
  })
}
