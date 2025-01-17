#' Confirm that an object is valid chrDomains
#'
#' @inheritParams shared-params
#' @returns `chrDomains` in all caps, if valid.
#' @keywords internal
validate_chrDomains <- function(
  chrDomains,
  lPlugins = NULL,
  envCall = rlang::caller_env()
) {
  known_domains <- c(
    "AE",
    "ENROLL",
    "LB",
    "PD",
    "SDRGCOMP",
    "STUDCOMP",
    "SUBJ",
    "DATACHG",
    "DATAENT",
    "QUERY"
  )
  upper_chrDomains <- toupper(chrDomains)
  unknown_domains <- setdiff(upper_chrDomains, known_domains)
  if (length(unknown_domains)) {
    unknown_domains_display <- chrDomains[
      upper_chrDomains %in% unknown_domains
    ]
    gsmappAbort(
      c(
        "{.arg chrDomains} must only contain known domains.",
        x = "Unknown domains: {.field {unknown_domains_display}}."
      ),
      strClass = "invalid_input",
      envCall = envCall
    )
  }
  if (length(lPlugins)) {
    chrPluginDomains <- purrr::map(lPlugins, "domains") %>%
      unlist() %>%
      toupper()
    missing_domains <- setdiff(chrPluginDomains, upper_chrDomains)
    if (length(missing_domains)) {
      gsmappAbort(
        c(
          "All {.arg lPlugins} domains must be included in {.arg chrDomains}.",
          x = "Missing domains: {.field {missing_domains}}."
        ),
        strClass = "invalid_input",
        envCall = envCall
      )
    }
  }

  return(upper_chrDomains)
}

## df-specific Validation Functions ----

#' Confirm that an object is a dfResults
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfResults <- function(x) {
  CheckDF(
    x,
    chrRequiredColumns = c(
      "GroupID", "Numerator", "Denominator", "Metric", "Score", "Flag",
      "MetricID", "SnapshotDate"
    )
  )
}

#' Confirm that an object is a dfGroups
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfGroups <- function(x) {
  CheckDF(
    x,
    chrRequiredColumns = c("GroupLevel", "Param", "Value", "GroupID")
  )
}

#' Confirm that an object is a dfMetrics
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfMetrics <- function(x) {
  CheckDF(x, chrRequiredColumns = c("MetricID", "Metric"))
}

#' Confirm that an object is a dfBounds
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfBounds <- function(x) {
  CheckDF(
    x,
    chrRequiredColumns = c("Threshold", "Denominator", "Numerator", "MetricID")
  )
}

#' Confirm that an object is a dfAnalyticsInput
#'
#' @inheritParams CheckDF
#' @inherit CheckDF return
#' @keywords internal
validate_dfAnalyticsInput <- function(x) {
  CheckDF(
    x,
    chrRequiredColumns = c(
      "GroupLevel",
      "GroupID",
      "Metric",
      "MetricID",
      "SubjectID",
      "Numerator",
      "Denominator"
    )
  )
}
