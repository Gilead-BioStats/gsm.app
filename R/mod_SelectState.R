#' Subset Choices
#'
#' @param strDependent `character` The value of the dependency. Can be `NULL`.
#' @param l_chrChoices `list` A named list of choice vectors.
#'
#' @returns `character` A vector of choices.
#' @keywords internal
SubsetChoices <- function(
  strDependent,
  l_chrChoices,
  envCall = rlang::caller_env()
) {
  if (is.null(strDependent)) {
    return(c("All", sort(unique(unlist(l_chrChoices)))))
  }
  if (strDependent %in% names(l_chrChoices)) {
    return(c("All", l_chrChoices[[strDependent]]))
  }
  gsmappAbort(
    "strDependent must be a valid name in l_chrChoices",
    strClass = "invalid_input",
    envCall = envCall
  )
}

#' Validate Selected Item
#'
#' @param strCurrentSelection `character` The current selection.
#' @param chrChoices `character` The available choices.
#' @param strDefault `character` The default value to return if the current
#'   selection is not in the available choices.
#'
#' @returns `character` The validated selection.
#' @keywords internal
ValidateSelected <- function(
  strCurrentSelection,
  chrChoices,
  strDefault = "All"
) {
  if (length(strCurrentSelection) && strCurrentSelection %in% chrChoices) {
    return(strCurrentSelection)
  }
  return(strDefault)
}

#' Select State Server
#'
#' A testable module that calculates the state of a cascading select input.
#'
#' @inheritParams mod_CascadingSelect_Server
#' @param rctv_strCurrentSelection `reactive` The currently selected value from
#'   the select input UI.
#'
#' @returns A `list` of `reactives`: `rctv_chrChoices`, `rctv_strLabel`, and
#'   `rctv_strSelected`.
#' @keywords internal
mod_SelectState_Server <- function(
  id,
  rctv_strDependent,
  l_chrChoices,
  lglUpdateLabel,
  rctv_strCurrentSelection
) {
  moduleServer(id, function(input, output, session) {
    rctv_chrChoices <- reactive({
      SubsetChoices(NullifyEmpty(rctv_strDependent()), l_chrChoices)
    })

    rctv_strLabel <- reactive({
      if (lglUpdateLabel) strong(NullifyEmpty(rctv_strDependent()))
    })

    rctv_strSelected <- reactive({
      ValidateSelected(rctv_strCurrentSelection(), rctv_chrChoices())
    })

    return(list(
      rctv_chrChoices = rctv_chrChoices,
      rctv_strLabel = rctv_strLabel,
      rctv_strSelected = rctv_strSelected
    ))
  })
}
