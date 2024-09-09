validate_df <- function(df,
                        chrRequiredColumns = character(),
                        arg = rlang::caller_arg(df),
                        call = rlang::caller_env()) {
  df <- validate_is_df(df, arg = arg, call = call)
  validate_has_columns(
    df,
    chrRequiredColumns = chrRequiredColumns,
    arg = arg,
    call = call
  )
}

validate_is_df <- function(df,
                           arg = rlang::caller_arg(df),
                           call = rlang::caller_env()) {
  if (is.data.frame(df)) {
    return(df)
  }
  cli::cli_abort(
    c(
      "{.arg {arg}} must be a data.frame.",
      x = "{.arg {arg}} is {.obj_type_friendly {df}}."
    ),
    class = "gsm.app-error-invalid_input",
    call = call
  )
}

validate_has_columns <- function(df,
                                 chrRequiredColumns = character(),
                                 arg = rlang::caller_arg(df),
                                 call = rlang::caller_env()) {
  missing_cols <- setdiff(chrRequiredColumns, colnames(df))
  if (length(missing_cols)) {
    cli::cli_abort(
      c(
        "{.arg {arg}} must have all required columns.",
        x = "Missing columns: {.field {missing_cols}}."
      ),
      class = "gsm.app-error-invalid_input"
    )
  }
  return(df)
}

## df-specific Validation Functions ----

validate_dfResults <- function(dfResults) {
  validate_df(dfResults, chrRequiredColumns = "SnapshotDate")
}

validate_dfGroups <- function(dfGroups) {
  validate_df(
    dfGroups,
    chrRequiredColumns = c("GroupLevel", "Param", "Value", "GroupID")
  )
}

validate_dfMetrics <- function(dfMetrics) {
  validate_df(dfMetrics, chrRequiredColumns = c("MetricID", "Metric"))
}

validate_dfBounds <- function(dfBounds) {
  validate_df(
    dfBounds,
    chrRequiredColumns = c("Threshold", "Denominator", "Numerator", "MetricID")
  )
}

validate_dfAnalyticsInput <- function(dfAnalyticsInput) {
  validate_df(dfAnalyticsInput, chrRequiredColumns = "SubjectID")
}
