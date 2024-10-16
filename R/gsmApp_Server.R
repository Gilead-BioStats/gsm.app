#' Define Server
#'
#' @inheritParams shared-params
#' @returns The main server function for use in a shiny app.
#' @keywords internal
gsmApp_Server <- function(
  dfAnalyticsInput,
  dfBounds,
  dfGroups,
  dfMetrics,
  dfResults,
  fnFetchParticipantData,
  fnServer = NULL
) {
  # Force evaluation of everything before factory is constructed to avoid
  # strange effects from lazy evaluation. See
  # https://adv-r.hadley.nz/function-factories.html#forcing-evaluation
  force(dfAnalyticsInput)
  force(dfBounds)
  force(dfGroups)
  force(dfMetrics)
  force(dfResults)
  force(fnFetchParticipantData)
  force(fnServer)
  function(input, output, session) {
    if (!is.null(fnServer)) {
      fnServer(input, output, session)
    }

    # Reset ----
    dfParticipantGroups <- make_dfParticipantGroups(dfAnalyticsInput)
    srvr_Reset(dfMetrics, dfParticipantGroups, reactive(input$reset), session)

    # Shared Reactives ----

    ## Inputs pass to modules (etc) as reactives.
    rctv_InputMetric <- reactive(input$metric)
    rctv_InputSite <- reactive(input$site)

    ## The listified dfMetrics are used by both metric sub-mods, so calculate
    ## them once. This can/should move inside a single metric-tab module.
    rctv_lMetric_base <- srvr_rctv_lMetric_base(
      dfMetrics,
      rctv_InputMetric,
      session
    )
    rctv_lMetric <- srvr_rctv_lMetric(
      dfMetrics,
      rctv_lMetric_base,
      rctv_InputMetric,
      rctv_InputSite,
      session
    )
    rctv_chrParticipantIDs <- srvr_rctv_chrParticipantIDs(
      dfParticipantGroups,
      rctv_InputSite
    )

    # Tab Contents ----

    ## Study Overview ----
    lStudyOverviewSelected <- mod_StudyOverview_Server(
      "study_overview",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfBounds = dfBounds,
      rctv_strSiteID = rctv_InputSite
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
    srvr_SyncTab("primary_nav_bar", "Metric Details", rctv_InputMetric, session)
    rctv_strMetricDetailsGroup <- mod_MetricDetails_Server(
      "metric_details",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_lMetric = rctv_lMetric,
      rctv_strSiteID = rctv_InputSite,
      rctv_strMetricID = rctv_InputMetric
    )
    rctv_strSiteDetailsParticipant <- mod_SiteDetails_Server(
      "site_details",
      dfGroups = dfGroups,
      dfAnalyticsInput = dfAnalyticsInput,
      rctv_strSiteID = rctv_InputSite,
      rctv_strMetricID = rctv_InputMetric,
      rctv_lMetric = rctv_lMetric
    )
    srvr_SyncSelectInput("site", rctv_strMetricDetailsGroup, session)

    # Temporary: Update Site drop-down when one of the non-module widgets
    # changes its value without sending a full Shiny event.
    srvr_SyncSelectInput("site", rctv_InputSite, session)

    ### Sync participant dropdown filter ----
    ###
    ### Revisit as app becomes fully modularized.
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
