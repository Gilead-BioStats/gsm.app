#' Remove a namespace from an id.
#'
#' @inheritParams shared-params
#' @param ns A function to apply a namespace to an object, such as the ones
#'   produced using [shiny::NS()] or the one available as `session$ns()` in a
#'   Shiny server function.
#'
#' @returns `id` minus the namespace.
#' @keywords internal
UnNS <- function(id, ns) {
  sub(paste0("^", ns("")), "", id)
}

#' Replace empty values with NULL
#'
#' @inheritParams shared-params
#' @returns The value, or `NULL` if the value is "None", "All", or an empty
#'   string.
#' @keywords internal
NullifyEmpty <- function(strValue) {
  if (
    length(strValue) == 0 ||
    identical(strValue, "None") ||
    identical(strValue, "All") ||
    identical(strValue, "")
  ) {
    return(NULL)
  }
  return(strValue)
}

#' gsm Color Scheme
#'
#' Choose a color from the "official" colors of the gsm family of packages.
#'
#' @inheritParams shared-params
#' @returns The hex code of a color.
#' @export
#' @examples
#' ColorScheme("gray")
#' ColorScheme("gray", "light")
#' ColorScheme("green")
#' ColorScheme("amber")
#' ColorScheme("red")
ColorScheme <- function(
  strColorName = c("gray", "green", "amber", "red"),
  strColorFamily = c("dark", "light")
) {
  strColorName <- tolower(strColorName)
  strColorFamily <- tolower(strColorFamily)
  strColorName <- rlang::arg_match(strColorName)
  strColorFamily <- rlang::arg_match(strColorFamily)
  colors <- list(
    light = c(
      red = "#FFABAC",
      amber = "#FED480",
      green = "#9ED782",
      gray = "#E5E5E5"
    ),
    dark = c(
      red = "#FF5859",
      amber = "#FEAA02",
      green = "#3DAF06",
      gray = "#828282"
    )
  )
  colors[[strColorFamily]][[strColorName]]
}

#' Load a Function for a Plugin
#'
#' @inheritParams shared-params
#'
#' @returns The function, if it can be found.
#' @keywords internal
AsFunction <- function(strFunction) {
  UseMethod("AsFunction")
}

#' @export
AsFunction.default <- function(strFunction) {
  rlang::as_function(strFunction)
}

#' @export
AsFunction.character <- function(strFunction) {
  fnFunction <- gsm.core::GetStrFunctionIfNamespaced(strFunction)
  # Extra step to work around things that are still character.
  rlang::as_function(fnFunction)
}

MakeParamLabelsChr <- function(chrParams, lParamLabels = NULL) {
  unlist(unname(gsm.kri::MakeParamLabelsList(chrParams, lParamLabels)))
}

#' Extract an App Title from dfGroups
#'
#' Extract the "nickname", "protocol_title", or "studyid" of the study from
#' `dfGroup` to use as a title for the app.
#'
#' @inheritParams shared-params
#'
#' @returns A length-1 character vector with the first available of "nickname",
#'   "protocol_title", or "studyid", if any are available as a `Param` in
#'   `dfGroups` with `GroupLevel == "Study"`, truncated to at most 30
#'   characters. If none of those are available, `"GSM Deep Dive"`.
#' @export
#'
#' @examples
#' ExtractAppTitle(sample_dfGroups)
#' ExtractAppTitle(
#'   data.frame(
#'     GroupLevel = "Study",
#'     Param = "nickname",
#'     Value = "This is a very long nickname which will be truncated"
#'   )
#' )
ExtractAppTitle <- function(dfGroups) {
  dfStudy <- dfGroups[dfGroups$GroupLevel == "Study", ]
  appTitle <- dfStudy$Value[tolower(dfStudy$Param) == "nickname"] %||%
    dfStudy$Value[tolower(dfStudy$Param) == "protocol_title"] %||%
    dfStudy$Value[tolower(dfStudy$Param) == "studyid"] %||%
    "GSM Deep Dive"
  if (rlang::is_installed("stringr")) {
    # Truncate to avoid overrun.
    return(stringr::str_trunc(appTitle, 30))
  }
  return(strtrim(appTitle, 30)) # nocov
}
