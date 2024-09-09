filter_byMetricID <- function(df, strMetricID) {
  filter_by(df, strMetricID)
}

filter_byGroupID <- function(df, strGroupID) {
  if (strGroupID == "None") {
    return(df)
  }
  filter_by(df, strGroupID)
}

filter_by <- function(
  df,
  Value,
  strField = extract_field_name(rlang::caller_arg(Value))) {
  df[df[strField] == Value, ]
}

extract_field_name <- function(strArgName) {
  # Delete the lowercase "arg type" info at the start of the value.
  sub("^[a-z]*", "", strArgName)
}
