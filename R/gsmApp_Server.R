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
  fnFetchData,
  chrDomains = c(
    "AE", "ENROLL", "LB", "PD", "SDRGCOMP", "STUDCOMP",
    "SUBJ", "DATACHG", "DATAENT", "QUERY"
  ),
  lPlugins = NULL,
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
  force(fnFetchData)
  force(fnServer)
  function(input, output, session) {
    if (!is.null(fnServer)) {
      fnServer(input, output, session)
    }

    # Reset ----
    observe({
      session$reload()
    }) %>%
      bindEvent(input$reset)

    # Shared Reactives ----

    ## Inputs pass to modules (etc) as reactives.
    rctv_strMetricID <- reactive(input$metric)
    rctv_strSiteID <- reactive(input$site)
    rctv_strSubjectID <- reactive(input$participant)
    rctv_strPrimaryNavBar <- reactive(input$primary_nav_bar)

    ## The listified dfMetrics are used by both metric sub-mods, so calculate
    ## them once. This can/should move inside a single metric-tab module.
    rctv_lMetric_base <- srvr_rctv_lMetric_base(
      dfMetrics,
      rctv_strMetricID,
      session
    )
    rctv_lMetric <- srvr_rctv_lMetric(
      dfMetrics,
      rctv_lMetric_base,
      rctv_strMetricID,
      rctv_strSiteID,
      session
    )
    dfParticipantGroups <- make_dfParticipantGroups(dfAnalyticsInput)
    rctv_chrParticipantIDs <- srvr_rctv_chrParticipantIDs(
      dfParticipantGroups,
      rctv_strSiteID
    )

    # Tab Contents ----

    ## Study Overview ----
    lStudyOverviewSelected <- mod_StudyOverview_Server(
      "study_overview",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfBounds = dfBounds,
      rctv_strSiteID = rctv_strSiteID
    )

    # Use clickCounter to update main GroupID and MetricID inputs + tab
    # movement, even if values don't change.
    #
    # I can't get the tests to see this happening.
    #
    # nocov start
    observe({
      strSelectedGroupID <- lStudyOverviewSelected$rctv_strSelectedGroupID()
      if (!is.null(strSelectedGroupID) && strSelectedGroupID != "") {
        updateSelectInput(session, "site", selected = strSelectedGroupID)
      }
      strSelectedMetricID <- lStudyOverviewSelected$rctv_strSelectedMetricID()
      if (!is.null(strSelectedMetricID) && strSelectedMetricID != "") {
        updateSelectInput(session, "metric", selected = strSelectedMetricID)
      }
      updateTabsetPanel(session, "primary_nav_bar", selected = "Metric Details")
    }) %>%
      bindEvent(
        lStudyOverviewSelected$rctv_intClickCounter(),
        ignoreInit = TRUE
      )
    # nocov end

    # Also update main inputs when GroupID or MetricID change independent of
    # those clicks.
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
      rctv_strMetricID,
      rctv_strPrimaryNavBar,
      session
    )
    srvr_SyncTab(
      "primary_nav_bar",
      "Metric Details",
      rctv_strSiteID,
      rctv_strPrimaryNavBar,
      session
    )
    rctv_strMetricDetailsGroup <- mod_MetricDetails_Server(
      "metric_details",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfBounds = dfBounds,
      rctv_lMetric = rctv_lMetric,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strMetricID = rctv_strMetricID
    )
    rctv_strSiteDetailsParticipant <- mod_SiteDetails_Server(
      "site_details",
      dfGroups = dfGroups,
      dfAnalyticsInput = dfAnalyticsInput,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strSubjectID = rctv_strSubjectID,
      rctv_strMetricID = rctv_strMetricID,
      rctv_lMetric = rctv_lMetric
    )
    srvr_SyncSelectInput("site", rctv_strMetricDetailsGroup, session)

    # Temporary: Update Site drop-down when one of the non-module widgets
    # changes its value without sending a full Shiny event.
    srvr_SyncSelectInput("site", rctv_strSiteID, session)

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
      rctv_strPrimaryNavBar,
      session
    )
    mod_ParticipantDetails_Server(
      "participant_details",
      fnFetchData = fnFetchData,
      chrDomains = chrDomains,
      rctv_strSubjectID = rctv_strSubjectID
    )

    ## Plugins ----
    mod_Plugins_Server(
      "plugins",
      lPlugins = lPlugins,
      fnFetchData = fnFetchData,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strSubjectID = rctv_strSubjectID
    )
  }
}
