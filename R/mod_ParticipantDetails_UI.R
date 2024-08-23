#' Participant Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_ParticipantDetails_UI <- function(id) {
  ns <- shiny::NS(id)
  ui <- tagList(
    div(
      class = "row",
      shiny::uiOutput(ns("metadata")),
      div(
        class = "col-12 col-sm-8 col-md-6 col-lg-5 col-xl-3 col-xxl-3",
        div(
          id = ns("card_placeholder_participant_metric_summary_data"),
          class = "card mb-3",
          div(
            class = "card-body",
            h5(class = "card-title", "Metric Summary"),
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
            id = ns("card_participant_metric_summary_data"),
            class = "card mb-3",
            div(
              class = "card-body",
              h5(class = "card-title", "Metric Summary"),
              hr(),
              uiOutput(ns("participant_metric_summary"))
            )
          )
        )
      ),
      div(
        class = "col-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 col-xxl-9",
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
              shiny::textOutput(ns("domain_data_table"))
            )
          )
        )
      )
    )
  )

  return(ui)
}
