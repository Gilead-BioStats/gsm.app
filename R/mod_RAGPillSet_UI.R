mod_RAGPillSet_UI <- function(id,
                               intRed = NULL,
                               intAmber = NULL,
                               strLabel = "KRIs") {
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
    )
  )
}

mod_RAGPillSet_Server <- function(id) {
  moduleServer(id, function(input, output, session) {
    rctv_lglRedState <- mod_TogglePill_Server(
      "red",
      rctv_lglState = shiny::reactive(TRUE)
    )
    rctv_lglAmberState <- mod_TogglePill_Server(
      "amber"
    )
    rctv_strGroupSubset <- shiny::reactive({
      states <- c("red", "amber")
      selected_states <- states[c(rctv_lglRedState(), rctv_lglAmberState())]
      if (length(selected_states)) {
        return(glue::glue_collapse(selected_states, sep = "/"))
      }
      return("all")
    })
    return(rctv_strGroupSubset)
  })
}
