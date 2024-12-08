#' Set of RAG Toggle Pills Server
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the state of the selection as a string.
#' @keywords internal
mod_RAGPillSet_Server <- function(id, rctv_strGroupSubset = reactive("red")) {
  moduleServer(id, function(input, output, session) {
    rctv_lglRed <- shiny::reactive({
      stringr::str_detect(rctv_strGroupSubset(), "red")
    })
    rctv_lglAmber <- shiny::reactive({
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
    rctv_strGroupSubset_internal <- shiny::reactive({
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
