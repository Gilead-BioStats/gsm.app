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
  ns <- NS(id)
  intRed <- intRed %||% 0L
  intAmber <- intAmber %||% 0L

  div(
    mod_TogglePill_UI(
      id = ns("red"),
      glue::glue("{intRed} Red {strLabel}"),
      ColorScheme("red")
    ),
    mod_TogglePill_UI(
      id = ns("amber"),
      glue::glue("{intAmber} Amber {strLabel}"),
      ColorScheme("amber")
    ),
    id = id
  )
}

#' Set of RAG Toggle Pills Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the state of the selection as a string.
#' @keywords internal
mod_RAGPillSet_Server <- function(id, rctv_strGroupSubset = reactive("red")) {
  moduleServer(id, function(input, output, session) {
    rctv_lglRed <- reactive({
      stringr::str_detect(rctv_strGroupSubset(), "red")
    })
    rctv_lglAmber <- reactive({
      stringr::str_detect(rctv_strGroupSubset(), "amber")
    })
    rctv_lglRedState <- mod_TogglePill_Server(
      "red",
      rctv_lglState = rctv_lglRed
    )
    rctv_lglAmberState <- mod_TogglePill_Server(
      "amber",
      rctv_lglAmber
    )
    rctv_strGroupSubset_internal <- reactive({
      states <- c("red", "amber")
      selected_states <- states[c(rctv_lglRedState(), rctv_lglAmberState())]
      if (length(selected_states)) {
        return(glue::glue_collapse(selected_states, sep = "/"))
      }
      return("all")
    })
    return(rctv_strGroupSubset_internal)
  })
}
