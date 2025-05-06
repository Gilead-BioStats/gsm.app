#' Group Details UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::layout_columns()] with group metadata and group participants.
#' @keywords internal
mod_GroupDetails_UI <- function(id, dfGroups) {
  ns <- NS(id)
  chrGroupLevels <- setdiff(sort(unique(dfGroups$GroupLevel)), "Study")
  strGroupWord <- ifelse(length(chrGroupLevels) == 1, chrGroupLevels, "Group")
  strGroupTitle <- glue::glue("{strGroupWord} Metadata")
  bslib::layout_columns(
    col_widths = c(5, 7),
    tagList(
      # TODO: Replace with a single module. Extra div is temporary to make the
      # hide/show cleaner.
      shinyjs::hidden(
        div(
          id = ns("card_group_metadata_list"),
          out_Card(
            strGroupTitle,
            uiOutput(ns("group_metadata_list")),
            id = ns("card_group_metadata_list-contents")
          )
        )
      ),
      out_Card(
        strGroupTitle,
        out_Placeholder(tolower(strGroupWord)),
        id = ns("card_placeholder_group_metadata_list")
      )
    ),
    mod_GroupParticipants_UI(ns("participants"))
  )
}

#' Group Details Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the id of the most recently selected
#'   participant.
#' @keywords internal
mod_GroupDetails_Server <- function(
  id,
  dfGroups,
  dfAnalyticsInput,
  rctv_strGroupID,
  rctv_strGroupLevel,
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

    rctv_dfAnalyticsInput_byMetric_byGroup <- reactive({
      req(rctv_strMetricID())
      req(rctv_strGroupLevel())
      req(rctv_strGroupID())
      rctv_dfAnalyticsInput_byMetric() %>%
        dplyr::filter(
          .data$GroupLevel == rctv_strGroupLevel(),
          .data$GroupID == rctv_strGroupID()
        ) %>%
        dplyr::arrange(dplyr::desc(.data$Metric)) %>%
        dplyr::select(!!!chrTargetColumns)
    }) %>%
      bindCache(rctv_strMetricID(), rctv_strGroupLevel(), rctv_strGroupID())

    rctv_lColumnNames <- reactive({
      req(rctv_strMetricID())
      metric_names <- rctv_lMetric()[c("Numerator", "Denominator", "Metric")]
      new_colnames <- rlang::set_names(chrTargetColumns, chrTargetColumns)
      new_colnames[names(metric_names)] <- metric_names
      new_colnames
    }) %>%
      bindCache(rctv_strMetricID())

    rctv_dfGroups_byGroupLevel <- reactive({
      req(rctv_strGroupLevel())
      dfGroups[dfGroups$GroupLevel == rctv_strGroupLevel(), ]
    }) %>%
      bindCache(rctv_strGroupLevel())
    rctv_lGroup <- reactive({
      dfGroups <- rctv_dfGroups_byGroupLevel()
      req(rctv_strGroupID())
      target_rows <- dfGroups$GroupID == rctv_strGroupID()
      rlang::set_names(
        dfGroups$Value[target_rows],
        MakeParamLabelsChr(dfGroups$Param[target_rows])
      )
    }) %>%
      bindCache(rctv_strGroupID())

    # This code will be removed in an upcoming update (when these are treated as
    # proper modules).
    #
    # nocov start
    observe({
      if (rctv_strGroupID() == "All") {
        ## Show placeholders
        shinyjs::hide("card_group_metadata_list")
        shinyjs::show("card_placeholder_group_metadata_list")
      } else {
        ## Hide placeholders
        shinyjs::hide("card_placeholder_group_metadata_list")
        shinyjs::show("card_group_metadata_list")
      }
    })
    # nocov end

    ### Group Metadata
    output$group_metadata_list <- renderUI({
      out_MetadataList(
        chrValues = rctv_lGroup()
      )
    })

    ### Group Participants Table Across Group Selected
    mod_GroupParticipants_Server(
      "participants",
      rctv_strGroupID,
      rctv_strGroupLevel,
      rctv_strSubjectID,
      rctv_dfAnalyticsInput_byMetric_byGroup,
      rctv_lColumnNames
    )
  })
}
