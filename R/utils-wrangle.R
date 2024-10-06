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

#' Reshape group and result info into study information
#'
#' @inheritParams shared-params
#' @returns A list with study information.
#' @keywords internal
make_lStudy <- function(dfGroups, dfResults) {
  dfStudy <- dfGroups[dfGroups$GroupLevel == "Study", c("Param", "Value")]
  lStudy <- as.list(rlang::set_names(dfStudy$Value, dfStudy$Param))
  # Temporarily only use some specific columns.
  lStudy <- temp_subsetLStudy(lStudy)
  lStudy$snapshot_date <- format(max(as.Date(dfResults$SnapshotDate)), "%Y-%m-%d")
  return(lStudy)
}

#' Subset study information
#'
#' THIS FUNCTION SHOULD BE REMOVED AS THE APP MATURES
#'
#' @inheritParams shared-params
#' @returns A list with a subset of study information.
#' @keywords internal
temp_subsetLStudy <- function(lStudy) {
  lStudy <- lStudy[c(
    "studyid",
    "nickname",
    "status",
    #"protocol_indication",
    #"therapeutic_area",
    #"phase",
    "SiteCount",
    "num_plan_site",
    "ParticipantCount",
    "num_plan_subj"
  )]
  names(lStudy) <- c(
    "studyid",
    "nickname",
    "status",
    #"Indication",
    #"Therapeutic Area",
    #"Phase",
    "Sites",
    "Sites (planned)",
    "Participants",
    "Participants (planned)"
  )
  return(lStudy)
}
