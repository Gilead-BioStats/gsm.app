# We might want to do this entirely via workflows, but I feel like it's good to
# check in the app itself since users don't HAVE to use workflows.

validate_chrDomains <- function(chrDomains, envCall = rlang::caller_env()) {
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
  upper_chrDomains <- union(toupper(chrDomains), "SUBJ")
  unknown_domains <- setdiff(upper_chrDomains, known_domains)
  if (length(unknown_domains)) {
    unknown_domains_display <- chrDomains[
      upper_chrDomains %in% unknown_domains
    ]
    gsmapp_abort(
      c(
        "{.arg chrDomains} must only contain known domains.",
        x = "Unknown domains: {.field {unknown_domains_display}}."
      ),
      strClass = "invalid_input",
      envCall = envCall
    )
  }
  return(upper_chrDomains)
}

#' Confirm that an object is the expected df
#'
#' @inheritParams shared-params
#' @inheritParams validate_is_df
#'
#' @returns `x`, if it passes the checks.
#' @keywords internal
validate_df <- function(
  x,
  chrRequiredColumns = character(),
  strArg = rlang::caller_arg(df),
  envCall = rlang::caller_env()
) {
  df <- validate_is_df(x, strArg = strArg, envCall = envCall)
  validate_has_columns(
    df,
    chrRequiredColumns = chrRequiredColumns,
    strArg = strArg,
    envCall = envCall
  )
}

#' Confirm that an object is a data.frame
#'
#' @inheritParams shared-params
#' @param x The object to validate.
#'
#' @returns `x`, if it is a data.frame.
#' @keywords internal
validate_is_df <- function(
  x,
  strArg = rlang::caller_arg(x),
  envCall = rlang::caller_env()
) {
  if (is.data.frame(x)) {
    return(x)
  }
  gsmapp_abort(
    c(
      "{.arg {strArg}} must be a data.frame.",
      x = "{.arg {strArg}} is {.obj_type_friendly {x}}."
    ),
    strClass = "invalid_input",
    envCall = envCall
  )
}

#' Confirm that a data.frame has required columns
#'
#' @inheritParams shared-params
#' @param df The data.frame to validate.
#'
#' @returns `df`, if it is has columns with the required names.
#' @keywords internal
validate_has_columns <- function(
  df,
  chrRequiredColumns = character(),
  strArg = rlang::caller_arg(df),
  envCall = rlang::caller_env()
) {
  missing_cols <- setdiff(chrRequiredColumns, colnames(df))
  if (length(missing_cols)) {
    gsmapp_abort(
      c(
        "{.arg {strArg}} must have all required columns.",
        x = "Missing columns: {.field {missing_cols}}."
      ),
      strClass = "invalid_input",
      envCall = envCall
    )
  }
  return(df)
}

## df-specific Validation Functions ----

#' Confirm that an object is a dfResults
#'
#' @inheritParams validate_df
#' @inherit validate_df return
#' @keywords internal
validate_dfResults <- function(x) {
  validate_df(
    x,
    chrRequiredColumns = c(
      "GroupID", "Numerator", "Denominator", "Metric", "Score", "Flag",
      "MetricID", "SnapshotDate"
    )
  )
}

#' Confirm that an object is a dfGroups
#'
#' @inheritParams validate_df
#' @inherit validate_df return
#' @keywords internal
validate_dfGroups <- function(x) {
  validate_df(
    x,
    chrRequiredColumns = c("GroupLevel", "Param", "Value", "GroupID")
  )
}

#' Confirm that an object is a dfMetrics
#'
#' @inheritParams validate_df
#' @inherit validate_df return
#' @keywords internal
validate_dfMetrics <- function(x) {
  validate_df(x, chrRequiredColumns = c("MetricID", "Metric"))
}

#' Confirm that an object is a dfBounds
#'
#' @inheritParams validate_df
#' @inherit validate_df return
#' @keywords internal
validate_dfBounds <- function(x) {
  validate_df(
    x,
    chrRequiredColumns = c("Threshold", "Denominator", "Numerator", "MetricID")
  )
}

#' Confirm that an object is a dfAnalyticsInput
#'
#' @inheritParams validate_df
#' @inherit validate_df return
#' @keywords internal
validate_dfAnalyticsInput <- function(x) {
  validate_df(
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
