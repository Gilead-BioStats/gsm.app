#' Check that an object has all required fields
#'
#' @inheritParams shared-params
#' @returns The validated object.
#' @keywords internal
validate_hasAllFields <- function(
  x,
  chrRequiredFields,
  strWhat = rlang::caller_arg(x),
  envCall = rlang::caller_env()
) {
  missing_fields <- setdiff(chrRequiredFields, names(x))
  if (length(missing_fields)) {
    gsmapp_abort(
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
validate_hasOnlyFields <- function(
    x,
    chrAllowedFields,
    strWhat = rlang::caller_arg(x),
    envCall = rlang::caller_env()
) {
  extra_fields <- setdiff(names(x), chrAllowedFields)
  if (!all(names(x) %in% chrAllowedFields)) {
    gsmapp_abort(
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
validate_in <- function(
  x,
  chrAllowedValues,
  strWhat = rlang::caller_arg(x),
  envCall
) {
  extra_values <- setdiff(x, chrAllowedValues)
  if (length(extra_values)) {
    gsmapp_abort(
      c(
        "{strWhat} must be in these values: {.field {chrAllowedValues}}.",
        x = "Unknown values: {.field {extra_values}}."
      ),
      strClass = "vector-values",
      envCall = envCall
    )
  }
  return(x)
}
