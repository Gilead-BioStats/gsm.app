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
    srvr_Reset(input, session)

    # Shared Reactives ----

    ## Inputs ----
    ##
    ## Inputs pass to modules (etc) as reactiveVals.
    rctv_strMetricID <- shiny::reactiveVal()
    shiny::observe({rctv_strMetricID(input$metric)})
    srvr_SyncSelectInput("metric", rctv_strMetricID, session)

    rctv_strSiteID <- shiny::reactiveVal()
    shiny::observe({rctv_strSiteID(input$site)})
    srvr_SyncSelectInput("site", rctv_strSiteID, session)

    ### Participants ----
    rctv_chrParticipantIDs <- srvr_rctv_chrParticipantIDs(
      dfAnalyticsInput,
      rctv_strSiteID
    )

    rctv_strSubjectID <- shiny::reactiveVal("All")
    shiny::observe({
      if (input$participant != "" && input$participant != rctv_strSubjectID()) {
        rctv_strSubjectID(input$participant)           # Tested via UI.
      }
    }) %>%
      shiny::bindEvent(input$participant)
    shiny::observe({
      if (input$participant != rctv_strSubjectID()) {
        updateSelectizeInput(                          # Tested via UI.
          inputId = "participant",                     # Tested via UI.
          choices = rctv_chrParticipantIDs(),          # Tested via UI.
          selected = rctv_strSubjectID(),              # Tested via UI.
          server = TRUE,                               # Tested via UI.
          session = session                            # Tested via UI.
        )
      }
    }) %>%
      shiny::bindEvent(rctv_strSubjectID())

    rctv_strPrimaryNavBar <- reactive(input$primary_nav_bar)

    ## Domains ----
    l_rctvDomains <- srvr_l_rctvDomains(
      fnFetchData,
      chrDomains,
      rctv_strSiteID,
      rctv_strSubjectID
    )

    # Tab Contents ----

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
          updateSelectizeInput(
            inputId = "participant",
            selected = "All",
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
      bindEvent(rctv_strSubjectID(), input$site)

    ## Domain Details ----
    srvr_SyncTab(
      "primary_nav_bar",
      "Domain Details",
      rctv_strSubjectID,
      rctv_strPrimaryNavBar,
      session
    )
    mod_DomainDetails_Server(
      "domain_details",
      l_rctvDomains = l_rctvDomains
    )

    ## Plugins ----
    mod_Plugins_Server(
      "plugins",
      lPlugins = lPlugins,
      l_rctvDomains = l_rctvDomains,
      rctv_strMetricID = rctv_strMetricID,
      rctv_strSiteID = rctv_strSiteID,
      rctv_strSubjectID = rctv_strSubjectID
    )
  }
}
