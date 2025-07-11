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
  fnCountData = ConstructDataCounter(fnFetchData),
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
  force(fnFetchData)
  force(fnCountData)
  force(chrDomains)
  force(lPlugins)
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
    firstGroupLevel <- sort(
      unique(dfMetrics$GroupLevel),
      decreasing = TRUE
    )[[1]]
    rctv_strPrimaryNavBar <- reactiveVal()
    rctv_strGroupLevel <- reactiveVal()
    rctv_strGroupID <- reactiveVal()
    rctv_strSubjectID <- reactiveVal("All")
    dfMetricsToSelect <- dfMetrics %>%
      dplyr::filter(.data$GroupLevel == firstGroupLevel)
    rctv_strMetricID <- reactiveVal(dfMetricsToSelect$MetricID[[1]])
    rctv_strDomainID <- reactiveVal(names(chrDomains)[[1]])
    # Future-proof by making SnapshotDate available to pass around.
    rctv_dSnapshotDate <- reactiveVal(max(dfResults$SnapshotDate))

    ## Primary Inputs ----
    ##
    ## Inputs update via reactiveVals.
    ### Groups ----
    lGroups <- dfGroups %>%
      dplyr::filter(.data$GroupLevel != "Study") %>%
      splitByGrouping("GroupLevel", "GroupID")

    mod_GroupInput_Server(
      "group",
      lGroups,
      rctv_strGroupID,
      rctv_strGroupLevel
    )

    ### Participants ----
    dfSubjectGroups <- dplyr::distinct(
      FilterByLatestIfPresent(dfAnalyticsInput),
      .data$GroupLevel,
      .data$GroupID,
      .data$SubjectID
    ) %>%
      dplyr::arrange(.data$SubjectID)

    lParticipantIDs <- splitByGrouping(dfSubjectGroups, "GroupID", "SubjectID")

    mod_CascadingSelect_Server(
      "participant",
      rctv_strDependent = rctv_strGroupID,
      l_chrChoices = lParticipantIDs,
      rctv_strSelection = rctv_strSubjectID,
      lglUpdateLabel = FALSE
    )

    ### Tabs ----
    observe({
      rctv_strPrimaryNavBar(input$primary_nav_bar)
    })
    # TODO: Sync tab in response to this reactive.

    ## Domain Data ----
    ##
    ## This stuff needs to be defined at the top so it's available to plugins.

    ## Reactive watchers are used to check whether domains have been accessed.
    ## That way, if higher-level data for a given domain has been fetched
    ## already, we can subset that rather than re-fetching.
    l_rctvDomainsLoaded <- purrr::map(
      chrDomains,
      function(strDomain) {
        c(
          list(Study = reactiveVal(FALSE)),
          purrr::map(
            lGroups,
            function(chrGroups) {
              purrr::map(
                rlang::set_names(chrGroups, chrGroups),
                ~ reactiveVal(FALSE)
              )
            }
          )
        )
      }
    )

    l_rctvDomains <- mod_dfDomains_Server(
      "l_rctv_dfDomains",
      fnFetchData = fnFetchData,
      chrDomains = chrDomains,
      dfSubjectGroups = dfSubjectGroups,
      l_rctvDomainsLoaded = l_rctvDomainsLoaded,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )

    ## Also produce a reusable hash of each domain, for cleaner caching.
    l_rctvDomainHashes <- mod_DomainHashes_Server(
      "l_rctv_strDomainHashes",
      l_rctvDomains,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )

    ## We actually USE l_rctvDomains transposed from what's easy to build.
    l_rctvDomains <- purrr::list_transpose(l_rctvDomains, simplify = FALSE)
    l_rctvDomainHashes <- purrr::list_transpose(l_rctvDomainHashes, simplify = FALSE)

    ## Also fetch the counts.
    rctv_intDomainCounts <- srvr_DomainCounts(
      "domain_counts",
      fnCountData = fnCountData,
      chrDomains = chrDomains,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID
    )

    # Tabs ----

    ## Study Overview ----
    mod_StudyOverview_Server(
      "study_overview",
      dfResults = FilterByLatestIfPresent(dfResults),
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfBounds = dfBounds,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strMetricID = rctv_strMetricID
    )

    ## Metric Details ----
    srvr_MetricDetails(
      dfAnalyticsInput = FilterByLatestIfPresent(dfAnalyticsInput),
      dfBounds = dfBounds,
      dfGroups = dfGroups,
      dfMetrics = dfMetrics,
      dfResults = dfResults,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strPrimaryNavBar = rctv_strPrimaryNavBar,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID,
      input = input,
      output = output,
      session = session
    )

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
      l_rctvDomains_Selection = l_rctvDomains$Selection,
      l_rctvDomainHashes_Selection = l_rctvDomainHashes$Selection,
      rctv_strDomainID = rctv_strDomainID,
      rctv_intDomainCounts = rctv_intDomainCounts,
      rctv_strGroupLevel = rctv_strGroupLevel,
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
      l_rctvDomainHashes = l_rctvDomainHashes,
      rctv_dSnapshotDate = rctv_dSnapshotDate,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strSubjectID = rctv_strSubjectID,
      rctv_strDomainID = rctv_strDomainID
    )
  }
}
