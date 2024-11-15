#' Toggle Pill Module Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] indicating whether the pill is "on"
#'   (`TRUE`) or "off" (`FALSE`).
#' @keywords internal
mod_TogglePill_Server <- function(id, rctv_lglState = shiny::reactive(FALSE)) {
  shiny::moduleServer(
    id,
    function(input, output, session) {
      pill_id <- session$ns("toggle_pill")

      rctv_lglStateInternal <- shiny::reactiveVal(FALSE)

      # Update rctv_lglStateInternal if the external state changes.
      shiny::observe({
        rctv_lglStateInternal(rctv_lglState())
      })

      # Update rctv_lglStateInternal on click.
      shiny::observe({
        lglNewState <- !rctv_lglStateInternal()
        rctv_lglStateInternal(lglNewState)
      }) %>%
        shiny::bindEvent(input$toggle_pill)

      # Observe changes in the reactive state to update the opacity
      shiny::observe({
        session$sendCustomMessage("updateOpacity", list(
          id = pill_id,
          opacity = if (rctv_lglStateInternal()) "1" else "0.5"
        ))
      })

      return(rctv_lglStateInternal)
    }
  )
}
