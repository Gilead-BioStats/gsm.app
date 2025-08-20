#' Group and GroupLevel Dropdown Menu UI
#'
#' @inheritParams shared-params
#' @returns A `list` with one or two UI elements.
#' @keywords internal
mod_GroupInput_UI <- function(id, dfGroups) {
  ns <- NS(id)
  # Default to the *last* GroupLevel to temporarily "hack" it to put Site first.
  chrGroupLevels <- setdiff(
    sort(unique(dfGroups$GroupLevel), decreasing = TRUE),
    "Study"
  )

  purrr::compact(list(
    mod_PotentialChoice_UI(
      ns("level"),
      chrChoices = chrGroupLevels,
      strLabel = "Group Level"
    ),
    mod_CascadingSelect_UI(
      ns("group"),
      strLabel = chrGroupLevels[[1]]
    )
  ))
}

#' Group and GroupLevel Dropdown Menu Server
#'
#' @inheritParams shared-params
#' @returns [shiny::observe()] objects to keep `GroupLevel` and `Group` inputs
#'   and reactives up-to-date.
#' @keywords internal
mod_GroupInput_Server <- function(
  id,
  lGroups,
  rctv_strGroupID,
  rctv_strGroupLevel
) {
  moduleServer(id, function(input, output, session) {
    mod_PotentialChoice_Server(
      "level",
      chrChoices = names(lGroups),
      rctv_strSelection = rctv_strGroupLevel
    )

    mod_CascadingSelect_Server(
      "group",
      rctv_strDependent = rctv_strGroupLevel,
      l_chrChoices = lGroups,
      rctv_strSelection = rctv_strGroupID,
      lglUpdateLabel = TRUE
    )
  })
}
