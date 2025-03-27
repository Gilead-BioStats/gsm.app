# This file is mostly tested via other files.

#' Check that an object has all required fields
#'
#' @inheritParams shared-params
#' @returns The validated object.
#' @keywords internal
CheckHasAllFields <- function(
  x,
  chrRequiredFields,
  strWhat = rlang::caller_arg(x),
  envCall = rlang::caller_env()
) {
  missing_fields <- setdiff(chrRequiredFields, names(x))
  if (length(missing_fields)) {
    gsmappAbort(
      c(
        "{strWhat} must include these fields: {.field {chrRequiredFields}}.",
        x = "Missing fields: {.field {missing_fields}}."
      ),
      strClass = "object-fields",
      envCall = envCall
    )
  }
  return(x)
}

#' Check that an object has only the allowed fields
#'
#' @inheritParams shared-params
#' @returns The validated object.
#' @keywords internal
CheckHasOnlyFields <- function(
  x,
  chrAllowedFields,
  strWhat = rlang::caller_arg(x),
  envCall = rlang::caller_env()
) {
  extra_fields <- setdiff(names(x), chrAllowedFields)
  if (!all(names(x) %in% chrAllowedFields)) {
    gsmappAbort(
      c(
        "{strWhat} can only include these fields: {.field {chrAllowedFields}}.",
        x = "Extra fields: {.field {extra_fields}}."
      ),
      strClass = "object-fields",
      envCall = envCall
    )
  }
  return(x)
}

#' Check that a vector is in another vector
#'
#' @inheritParams shared-params
#' @returns The validated object.
#' @keywords internal
CheckIsIn <- function(
  x,
  chrAllowedValues,
  strWhat = rlang::caller_arg(x),
  envCall
) {
  extra_values <- setdiff(x, chrAllowedValues)
  if (length(extra_values)) {
    gsmappAbort(
      c(
        "{strWhat} must be in these values: {.field {chrAllowedValues}}.",
        x = "Unknown values: {.field {extra_values}}."
      ),
      strClass = "vector-values",
      envCall = envCall
    )
  }
  return(x) # nocov
}

#' Confirm that an object is the expected df
#'
#' @inheritParams shared-params
#' @inheritParams CheckIsDF
#'
#' @returns `x`, if it passes the checks.
#' @keywords internal
CheckDF <- function(
  x,
  chrRequiredColumns = character(),
  strArg = rlang::caller_arg(df),
  envCall = rlang::caller_env()
) {
  df <- CheckIsDF(x, strArg = strArg, envCall = envCall)
  CheckHasColumns(
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
CheckIsDF <- function(
  x,
  strArg = rlang::caller_arg(x),
  envCall = rlang::caller_env()
) {
  if (is.data.frame(x)) {
    return(x)
  }
  gsmappAbort(
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
CheckHasColumns <- function(
    df,
    chrRequiredColumns = character(),
    strArg = rlang::caller_arg(df),
    envCall = rlang::caller_env()
) {
  missing_cols <- setdiff(chrRequiredColumns, colnames(df))
  if (length(missing_cols)) {
    gsmappAbort(
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

#' Confirm that an object is a string
#'
#' @inheritParams shared-params
#' @param x The object to validate.
#'
#' @returns `x`, if it is a length-1 character vector and isn't `NA`.
#' @keywords internal
CheckIsString <- function(
  x,
  strArg = rlang::caller_arg(x),
  envCall = rlang::caller_env()
) {
  if (rlang::is_scalar_character(x) && !is.na(x)) {
    return(x)
  }
  gsmappAbort(
    c(
      "{.arg {strArg}} must be a length-1 character vector.",
      x = "{.arg {strArg}} is {.obj_type_friendly {x}}."
    ),
    strClass = "invalid_input",
    envCall = envCall
  )
}
