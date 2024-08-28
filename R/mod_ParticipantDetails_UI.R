#' Participant Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_ParticipantDetails_UI <- function(id) {
  ns <- NS(id)
  ui <- div(
    class = "row pt-1",
    uiOutput(ns("metadata")),
    mod_ParticipantMetricSummary_UI(ns("metric_summary")),
    div(
      div(
        id = ns("card_placeholder_participant_domain_data"),
        class = "card mb-3",
        div(
          class = "card-body",
          h5(class = "card-title", "Participant Domain"),
          hr(),
          div(
            class = "card placeholder",
            div(
              class = "card-body",
              div(
                class = "card-text",
                "Please select a participant."
              )
            )
          )
        )
      ),
      shinyjs::hidden(
        div(
          id = ns("card_placeholder_participant_domain_data_no_metric"),
          class = "card mb-3",
          div(
            class = "card-body",
            h5(class = "card-title", "Participant Domain"),
            hr(),
            div(
              class = "card placeholder",
              div(
                class = "card-body",
                div(
                  class = "card-text",
                  "Please select a metric in the Metric Summary Card above."
                )
              )
            )
          )
        )
      ),
      shinyjs::hidden(
        div(
          id = ns("card_participant_domain_data"),
          class = "card mb-3",
          div(
            class = "card-body",
            h5(class = "card-title", "Participant Domain"),
            radioButtons(
              ns("show_hide_columns"),
              label = "Show all columns?",
              choices = c("Hide", "Show"),
              selected = "Hide",
              inline = TRUE
            ),
            # Placeholder textOutput for the table, to be replaced with the
            # "real" output format when server is implemented.
            textOutput(ns("domain_data_table"))
          )
        )
      )
    )
  )

  return(ui)
}
