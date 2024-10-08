#' Define Server
#'
#' @inheritParams shared-params
#' @returns The main server function for use in a shiny app.
#' @keywords internal
gsmApp_Server <- function(
  dfResults,
  dfGroups,
  dfMetrics,
  dfBounds,
  dfAnalyticsInput,
  fnFetchParticipantData
) {
  # Force evaluation of everything before factory is constructed to avoid
  # strange effects from lazy evaluation. See
  # https://adv-r.hadley.nz/function-factories.html#forcing-evaluation
  force(dfResults)
  force(dfGroups)
  force(dfMetrics)
  force(dfBounds)
  force(dfAnalyticsInput)
  force(fnFetchParticipantData)
  function(input, output, session) {
    # Inputs ----
    ## Initialize ----
    dfAnalyticsInput_Unique <- dfAnalyticsInput %>%
      dplyr::distinct(.data$SubjectID, .data$GroupID) %>%
      dplyr::arrange(.data$SubjectID)
    chrParticipantIDs <- dfAnalyticsInput_Unique$SubjectID

    ## Reset ----
    observe({
      updateSelectInput(session, "metric", selected = dfMetrics$MetricID[[1]])
      updateSelectInput(session, "site", selected = "None")
      updateSelectizeInput(
        "participant",
        choices = c("None", chrParticipantIDs),
        selected = "None",
        server = TRUE,
        session = session
      )
      bslib::nav_select("primary_nav_bar", "Study Overview")
    }) %>%
      bindEvent(input$reset)

    # Shared Reactives ----

    ## The listified dfMetrics are used by both metric sub-mods, so calculate
    ## them once. This can/should move inside a single metric-tab module.
    rctv_lMetric_base <- reactive({
      as.list(
        filter_byMetricID(dfMetrics, input$metric)
      )
    }) %>%
      bindCache(input$metric)
    rctv_lMetric <- reactive({
      lMetric <- rctv_lMetric_base()
      if (input$site != "None") {
        lMetric$selectedGroupIDs <- input$site
      }
      lMetric
    }) %>%
      shiny::bindCache(input$metric, input$site)

    rctv_chrParticipantIDs <- reactive({
      if (input$site == "None") {
        return(c("None", dfAnalyticsInput_Unique$SubjectID))
      }
      c(
        "None",
        dfAnalyticsInput_Unique$SubjectID[
          dfAnalyticsInput_Unique$GroupID == input$site
        ]
      )
    }) %>%
      bindCache(input$site)

    # Tab Contents ----

    ## Study Overview ----
    lStudyOverviewSelected <- mod_StudyOverview_Server(
      "study_overview",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfBounds = dfBounds,
      rctv_strSiteID = reactive(input$site)
    )
    srvr_SyncSelectInput(
      "site",
      lStudyOverviewSelected$rctv_strSelectedGroupID,
      session
    )
    srvr_SyncSelectInput(
      "metric",
      lStudyOverviewSelected$rctv_strSelectedMetricID,
      session
    )

    ## Metric Details ----
    srvr_SyncTab(
      "primary_nav_bar",
      "Metric Details",
      reactive(input$metric),
      session
    )
    ## Don't render until it loads. We should be able to fix this later once
    ## nested-modules are implemented cleanly.
    bindEvent(
      {
        rctv_strMetricDetailsGroup <- mod_MetricDetails_Server(
          "metric_details",
          dfResults = dfResults,
          dfGroups = dfGroups,
          dfBounds = dfBounds,
          rctv_lMetric = rctv_lMetric,
          rctv_strSiteID = reactive(input$site),
          rctv_strMetricID = reactive(input$metric)
        )
        rctv_strSiteDetailsParticipant <- mod_SiteDetails_Server(
          "site_details",
          dfGroups = dfGroups,
          dfAnalyticsInput = dfAnalyticsInput,
          rctv_strSiteID = reactive(input$site),
          rctv_strMetricID = reactive(input$metric),
          rctv_lMetric = rctv_lMetric
        )
      },
      input$primary_nav_bar == "Metric Details",
      ignoreInit = TRUE,
      once = TRUE
    )
    srvr_SyncSelectInput("site", rctv_strMetricDetailsGroup, session)

    # Temporary: Update Site drop-down when one of the non-module widgets
    # changes its value without sending a full Shiny event.
    srvr_SyncSelectInput("site", reactive(input$site), session)

    rctv_LatestParticipant <- reactiveVal("None")
    observe({
      req(input$participant)
      strParticipantID <- input$participant
      if (
        length(strParticipantID) &&
        strParticipantID != "" &&
        strParticipantID != rctv_LatestParticipant()
      ) {
        rctv_LatestParticipant(strParticipantID)
      }
    }) %>%
      bindEvent(input$participant)
    observe({
      req(rctv_strSiteDetailsParticipant())
      strParticipantID <- rctv_strSiteDetailsParticipant()
      if (
          length(strParticipantID) &&
          strParticipantID != "" &&
          strParticipantID != rctv_LatestParticipant()
      ) {
        rctv_LatestParticipant(strParticipantID)
      }
    }) %>%
      bindEvent(rctv_strSiteDetailsParticipant())

    rctv_LastSiteFilter <- reactiveVal("unfiltered")
    observe({
      req(rctv_LatestParticipant())
      req(rctv_chrParticipantIDs())
      req(rctv_LastSiteFilter())
      selected <- "None"
      if (rctv_LatestParticipant() %in% rctv_chrParticipantIDs()) {
        selected <- rctv_LatestParticipant()
      }
      if (
          selected != input$participant ||
          rctv_LastSiteFilter() != input$site
      ) {
        rctv_LastSiteFilter(input$site)
        if (selected == "None") {
          # This double-update prevents the old option from showing in the list
          # erroneously.
          updateSelectizeInput(
            inputId = "participant",
            selected = "None",
            server = TRUE,
            session = session
          )
        }
        updateSelectizeInput(
          inputId = "participant",
          choices = rctv_chrParticipantIDs(),
          selected = selected,
          server = TRUE,
          session = session
        )
      }
    }) %>%
      bindEvent(rctv_LatestParticipant(), input$site)

    ## Participant Details ----
    srvr_SyncTab(
      "primary_nav_bar",
      "Participant Details",
      # reactive(input$participant),
      rctv_LatestParticipant,
      session
    )
    mod_ParticipantDetails_Server(
      "participant_details",
      fnFetchParticipantData = fnFetchParticipantData,
      rctv_strSubjectID = reactive(input$participant)
    )
  }
}
