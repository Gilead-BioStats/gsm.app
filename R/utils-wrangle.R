#' Filter by a detected field
#'
#' @param df A data.frame to filter.
#' @param Value The value to filter on.
#' @param strField The name of the field. Auto-detected by default from the
#'   variable used to provide `Value`.
#' @returns The filtered data.frame.
#' @keywords internal
filter_by <- function(
  df,
  Value,
  strField = extract_field_name(rlang::caller_arg(Value))) {
  df[df[[strField]] == Value, ]
}

#' Get a field name from a variable name
#'
#' Assume standard argument name format, like `strGroupID` or `dSnapshotDate`.
#'
#' @param strArgName The name of the argument.
#' @returns `strArgName` with the beginning part removed.
#' @keywords internal
extract_field_name <- function(strArgName) {
  # Delete the lowercase "arg type" info at the start of the value.
  sub("^[a-z]*", "", strArgName)
}

#' Filter by MetricID
#'
#' @inheritParams filter_by
#' @inheritParams shared-params
#' @inherit filter_by return
#' @keywords internal
filter_byMetricID <- function(df, strMetricID) {
  filter_by(df, strMetricID)
}

#' Filter by GroupID
#'
#' @inheritParams filter_by
#' @inheritParams shared-params
#' @inherit filter_by return
#' @keywords internal
filter_byGroupID <- function(df, strGroupID) {
  if (strGroupID == "None") {
    return(df)
  }
  filter_by(df, strGroupID)
}

#' Filter and sort participants by group
#'
#' @inheritParams shared-params
#' @returns A data.frame with `SubjectID` and `GroupID`.
#' @keywords internal
make_dfParticipantGroups <- function(dfAnalyticsInput) {
  dplyr::arrange(
    dplyr::distinct(dfAnalyticsInput, .data$SubjectID, .data$GroupID),
    .data$SubjectID
  )
}

#' Find interesting digits for rounding
#'
#' @param dblX A vector of numbers (usually with decimal places).
#' @param intMaxDecimals The maximum number of decimal places to keep.
#' @returns An integer between `0` and `intMaxDecimals`, representing the number
#'   of decimal places to keep.
#' @keywords internal
findNonZeroDecimals <- function(dblX, intMaxDecimals = 5L) {
  if (intMaxDecimals > 0 && is.numeric(dblX) && !rlang::is_integerish(dblX)) {
    # Avoid floating point precision issues.
    scaled_x <- round(dblX * 10^intMaxDecimals)

    for (pow in seq_len(intMaxDecimals) - 1L) {
      if (!all((scaled_x %/% (10^pow)) %% 10 == 0)) {
        return(intMaxDecimals - pow)
      }
    }
  }

  # No interesting decimals.
  return(0L)
}

#' Apply user-facing domain names
#'
#' @inheritParams shared-params
#' @returns The list of domain dfs, with better user-facing names.
#' @keywords internal
applyPrettyDomainNames <- function(lDomains) {
  chrDomains <- names(lDomains)
  domainLabels <- sort(unlist(
    gsm::MakeParamLabelsList(chrDomains, chrDomainLabels)
  ))
  # Sort by those labels.
  lDomains <- lDomains[names(domainLabels)]
  # Keep spaces out of names for better Shiny compatability.
  names(lDomains) <- gsub(" ", "_", unname(domainLabels))
  lDomains
}
