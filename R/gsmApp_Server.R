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
    AE = "Adverse Events",
    DATACHG = "Data Changes",
    DATAENT = "Data Entry",
    ENROLL = "Enrollment",
    LB = "Lab",
    PD = "Protocol Deviations",
    QUERY = "Queries",
    STUDCOMP = "Study Completion",
    SUBJ = "Subject Metadata",
    SDRGCOMP = "Treatment Completion"
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
  force(chrDomains)
  force(fnFetchData)
  force(fnServer)
  function(input, output, session) {
    # Extras ----
    if (!is.null(fnServer)) {
      fnServer(input, output, session)
    }

    # Reset ----
    srvr_Reset(input, session)

    # Shared Reactives ----

    ## reactiveVals ----
    rctv_strPrimaryNavBar <- reactiveVal()
    rctv_strSiteID <- reactiveVal()
    rctv_strSubjectID <- reactiveVal("All")
    rctv_strMetricID <- reactiveVal(dfMetrics$MetricID[[1]])
    rctv_strDomainID <- reactiveVal(names(chrDomains)[[1]])
    # Future-proof by making SnapshotDate available to pass around.
    rctv_dateSnapshot <- reactiveVal(max(dfResults$SnapshotDate))

    ## Primary Inputs ----
    ##
    ## Inputs update via reactiveVals.
    observe({rctv_strSiteID(input$site)})
    srvr_SyncVirtualSelectInput("site", rctv_strSiteID, session)

    observe({rctv_strPrimaryNavBar(input$primary_nav_bar)})
    # TODO: Sync tab in response to this reactive.

    ### Participants ----
    rctv_chrParticipantIDs <- srvr_rctv_chrParticipantIDs(
      dfAnalyticsInput,
      rctv_strSiteID
    )

    observe({
      if (input$participant != "" && input$participant != rctv_strSubjectID()) {
        rctv_strSubjectID(input$participant)           # Tested via UI.
      }
    }) %>%
      bindEvent(input$participant)
    observe({
      if (input$participant != rctv_strSubjectID()) {
        shinyWidgets::updateVirtualSelect(
          inputId = "participant",
          choices = rctv_chrParticipantIDs(),
          selected = rctv_strSubjectID(),
          session = session
        )
      }
    }) %>%
      bindEvent(rctv_strSubjectID())

    ## Domain Data ----
    ##
    ## This needs to be defined at the top so it's available to plugins.
    l_rctvDomains <- mod_dfDomains_Server(
      "l_rctv_dfDomains",
      fnFetchData,
      chrDomains,
      rctv_strSiteID,
      rctv_strSubjectID
    )

    # Tabs ----

    ## Study Overview ----
    mod_StudyOverview_Server(
      "study_overview",
      dfResults = dfResults,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfBounds = dfBounds,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strMetricID
    )

    ## Metric Details ----
    srvr_MetricDetails(
      dfAnalyticsInput = dfAnalyticsInput,
      dfBounds = dfBounds,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfResults = dfResults,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strPrimaryNavBar = rctv_strPrimaryNavBar,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strSubjectID = rctv_strSubjectID,
      input = input,
      output = output,
      session = session
    )

    ## Sync participant dropdown filter ----
    ##
    ## Revisit as app becomes fully modularized.
    rctv_LastSiteFilter <- reactiveVal("unfiltered")
    observe({
      req(rctv_strSubjectID())
      req(rctv_chrParticipantIDs())
      req(rctv_LastSiteFilter())
      selected <- "All"
      if (rctv_strSubjectID() %in% rctv_chrParticipantIDs()) {
        selected <- rctv_strSubjectID()
      }
      if (
        selected != input$participant ||
          rctv_LastSiteFilter() != input$site
      ) {
        rctv_LastSiteFilter(input$site)
        if (selected == "All") {
          # This double-update prevents the old option from showing in the list
          # erroneously.
          shinyWidgets::updateVirtualSelect(
            inputId = "participant",
            selected = "All",
            session = session
          )
        }
        shinyWidgets::updateVirtualSelect(
          inputId = "participant",
          choices = rctv_chrParticipantIDs(),
          selected = selected,
          session = session
        )
      }
    }) %>%
      bindEvent(rctv_strSubjectID(), input$site)

    ## Domain Details ----
    srvr_SyncTab(
      "primary_nav_bar",
      "Domain Details",
      rctv_strDomainID,
      rctv_strPrimaryNavBar,
      chrFromTabs = c("Study Overview", "Metric Details"),
      session = session
    )
    srvr_SyncTab(
      "primary_nav_bar",
      "Domain Details",
      rctv_strSubjectID,
      rctv_strPrimaryNavBar,
      chrFromTabs = c("Study Overview", "Metric Details"),
      session = session
    )
    mod_DomainDetails_Server(
      "domain_details",
      l_rctvDomains = l_rctvDomains,
      rctv_strDomainID = rctv_strDomainID,
      chrDomains = chrDomains
    )

    ## Plugins ----
    mod_Plugins_Server(
      "plugins",
      lPlugins = lPlugins,
      dfAnalyticsInput = dfAnalyticsInput,
      dfBounds = dfBounds,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfResults = dfResults,
      l_rctvDomains = l_rctvDomains,
      rctv_dateSnapshot = rctv_dateSnapshot,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strSubjectID = rctv_strSubjectID,
      rctv_strDomainID = rctv_strDomainID
    )
  }
}
