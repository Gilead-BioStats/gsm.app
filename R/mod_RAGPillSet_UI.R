#' Clickable KRI Count Pills
#'
#' @inheritParams shared-params
#' @returns A [htmltools::tagList()] of [mod_TogglePill_UI()] items, one for red
#'   flags, and one for amber flags.
#' @keywords internal
mod_RAGPillSet_UI <- function(
  id,
  intRed = NULL,
  intAmber = NULL,
  strLabel = "KRIs"
) {
  ns <- shiny::NS(id)
  intRed <- intRed %||% 0L
  intAmber <- intAmber %||% 0L

  div(
    mod_TogglePill_UI(
      id = ns("red"),
      glue::glue("{intRed} Red {strLabel}"),
      colorScheme("red")
    ),
    mod_TogglePill_UI(
      id = ns("amber"),
      glue::glue("{intAmber} Amber {strLabel}"),
      colorScheme("amber")
    ),
    id = id
  )
}
