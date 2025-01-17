#' Reactive lMetric by metric
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, filtered by metric.
#' @keywords internal
srvr_rctv_lMetric_base <- function(
  dfMetrics,
  rctv_strMetricID,
  session = getDefaultReactiveDomain()
) {
  reactive({
    as.list(
      FilterbyMetricID(dfMetrics, rctv_strMetricID())
    )
  }) %>%
    bindCache(rctv_strMetricID())
}

#' Reactive lMetric by metric and site
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, with information about
#'   the selected site.
#' @keywords internal
srvr_rctv_lMetric <- function(
  dfMetrics,
  rctv_strMetricID,
  rctv_strSiteID,
  session = getDefaultReactiveDomain()
) {
  rctv_lMetric_base <- srvr_rctv_lMetric_base(
    dfMetrics,
    rctv_strMetricID,
    session
  )
  reactive({
    lMetric <- rctv_lMetric_base()
    site <- rctv_strSiteID()
    if (site != "None") {
      lMetric$selectedGroupIDs <- site
    }
    lMetric
  }) %>%
    shiny::bindCache(rctv_strMetricID(), rctv_strSiteID())
}

#' Reactive participant IDs
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] of dfMetrics as a list, filtered by metric.
#' @keywords internal
srvr_rctv_chrParticipantIDs <- function(
  dfAnalyticsInput,
  rctv_strSiteID
) {
  dfParticipantGroups <- dplyr::arrange(
    dplyr::distinct(dfAnalyticsInput, .data$SubjectID, .data$GroupID),
    .data$SubjectID
  )
  reactive({
    site <- rctv_strSiteID()
    if (site == "None") {
      return(c("All", dfParticipantGroups$SubjectID))
    }
    c(
      "All",
      dfParticipantGroups$SubjectID[
        dfParticipantGroups$GroupID == site
      ]
    )
  }) %>%
    bindCache(rctv_strSiteID())
}

#' List of reactive domain dfs
#'
#' @inheritParams shared-params
#' @returns A list of [shiny::reactive()]s with domain dfs.
#' @keywords internal
srvr_l_rctvDomains <- function(
  fnFetchData,
  chrDomains,
  rctv_strSiteID,
  rctv_strSubjectID
) {
  # This is an area that could use a lot of optimization; this is almost
  # certainly the slowest part of the app.
  l_rctvDomains <- purrr::map(chrDomains, function(this_domain) {
    shiny::reactive({
      withProgress(
        message = glue::glue("Loading {this_domain} data"),
        {
          fnFetchData(
            this_domain,
            strSiteID = NullifyEmpty(rctv_strSiteID()),
            strSubjectID = NullifyEmpty(rctv_strSubjectID())
          )
        }
      )
    }) %>%
      shiny::bindCache(this_domain, rctv_strSiteID(), rctv_strSubjectID())
  })
  names(l_rctvDomains) <- chrDomains
  return(l_rctvDomains)
}
