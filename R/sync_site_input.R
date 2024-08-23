#' Synchronize site drop-down with click input
#'
#' When a user clicks a site in a widget, also update the drop-down menu to
#' match.
#'
#' @inheritParams shared-params
#'
#' @return An observer (see  [shiny::observe()]) that updates the site drop-down
#'   menu whenever the input value changes.
#' @keywords internal
sync_site_input <- function(rctv_strSiteID) {
  # Update site input when client-side selection occurs.
  shiny::observe({
    shiny::updateSelectInput(
      inputId = "site",
      selected = rctv_strSiteID()
    )
  })
}
