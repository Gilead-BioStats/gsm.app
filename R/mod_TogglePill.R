#' Toggle Pill Module UI
#'
#' @inheritParams shared-params
#' @returns A [htmltools::tagList()] with a specialized [shiny::actionLink()]
#'   and the necessary CSS and JavaScript to manage the link.
#' @keywords internal
mod_TogglePill_UI <- function(id, strLabel, strColorCode) {
  ns <- NS(id)
  tagList(
    actionLink(
      ns("toggle_pill"),
      label = strLabel,
      style = glue::glue("background-color: {strColorCode}; opacity: 0.5;"),
      class = "badge rounded-pill toggle-pill text-dark fs-6 p-2"
    ),
    htmlDependency_TogglePill()
  )
}

#' TogglePill Dependencies
#'
#' Attach CSS and JavaScript necessary for TogglePill to an app or other HTML
#' exactly once.
#'
#' @returns An [htmltools::tagList()] of `html_dependency` objects (see
#'   [htmltools::htmlDependency()]), so that each will be attached to the Shiny
#'   app exactly once, regardless how many times they are added.
#' @keywords internal
htmlDependency_TogglePill <- function() {
  tagList(
    htmlDependency_updateStyleJS(),
    htmlDependency_Stylesheet("togglePill.css")
  )
}

#' Style JavaScript
#'
#' Attach `updateStyle.js` to an app or other HTML exactly once.
#'
#' @returns An `html_dependency` object (see [htmltools::htmlDependency()]),
#'   which is attached to the Shiny app exactly once, regardless how many times
#'   it is added.
#' @keywords internal
htmlDependency_updateStyleJS <- function() {
  htmltools::htmlDependency(
    name = "updateStyle",
    version = "1.0.0",
    src = "js",
    package = "gsm.app",
    script = "updateStyle.js"
  )
}

#' Toggle Pill Module Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] indicating whether the pill is "on"
#'   (`TRUE`) or "off" (`FALSE`).
#' @keywords internal
mod_TogglePill_Server <- function(id, rctv_lglState = shiny::reactive(FALSE)) {
  moduleServer(
    id,
    function(input, output, session) {
      pill_id <- session$ns("toggle_pill")

      rctv_lglStateInternal <- reactiveVal(FALSE)

      # Update rctv_lglStateInternal if the external state changes.
      observe({
        rctv_lglStateInternal(rctv_lglState())
      })

      # Update rctv_lglStateInternal on click.
      observe({
        lglNewState <- !rctv_lglStateInternal()
        rctv_lglStateInternal(lglNewState)
      }) %>%
        bindEvent(input$toggle_pill)

      # Observe changes in the reactive state to update the opacity
      observe({
        session$sendCustomMessage("updateOpacity", list(
          id = pill_id,
          opacity = if (rctv_lglStateInternal()) "1" else "0.5"
        ))
      })

      return(rctv_lglStateInternal)
    }
  )
}
