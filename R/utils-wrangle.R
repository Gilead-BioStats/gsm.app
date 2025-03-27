#' Filter by a detected field
#'
#' @param df A data.frame to filter.
#' @param Value The value to filter on.
#' @param strField The name of the field. Auto-detected by default from the
#'   variable used to provide `Value`.
#' @returns The filtered data.frame.
#' @keywords internal
FilterBy <- function(
  df,
  Value,
  strField = ExtractFieldName(rlang::caller_arg(Value))) {
  if (length(Value)) {
    return(df[df[[strField]] == Value, ])
  }
  return(df) # nocov
}

#' Get a field name from a variable name
#'
#' Assume standard argument name format, like `strGroupID` or `dSnapshotDate`.
#'
#' @param strArgName The name of the argument.
#' @returns `strArgName` with the beginning part removed.
#' @keywords internal
ExtractFieldName <- function(strArgName) {
  # Delete the lowercase "arg type" info at the start of the value.
  sub("^[a-z]*", "", strArgName)
}

#' Filter by MetricID
#'
#' @inheritParams FilterBy
#' @inheritParams shared-params
#' @inherit FilterBy return
#' @keywords internal
FilterbyMetricID <- function(df, strMetricID) {
  FilterBy(df, strMetricID)
}

#' Filter by GroupID
#'
#' @inheritParams FilterBy
#' @inheritParams shared-params
#' @inherit FilterBy return
#' @keywords internal
FilterbyGroupID <- function(df, strGroupID) {
  if (strGroupID == "All") {
    return(df)
  }
  FilterBy(df, strGroupID)
}

#' Find interesting digits for rounding
#'
#' @param dblX A vector of numbers (usually with decimal places).
#' @param intMaxDecimals The maximum number of decimal places to keep.
#' @returns An integer between `0` and `intMaxDecimals`, representing the number
#'   of decimal places to keep.
#' @keywords internal
FindNonZeroDecimals <- function(dblX, intMaxDecimals = 5L) {
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
