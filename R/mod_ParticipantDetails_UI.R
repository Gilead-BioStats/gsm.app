#' Participant Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_ParticipantDetails_UI <- function(id) {
  ns <- NS(id)
  ui <- div(
    class = "row",
    uiOutput(ns("metadata")),
    uiOutput(ns("metric_summary")),
    # mod_ParticipantMetricSummary_UI(ns("metric_summary")),
    div(
      class = "col-12 col-sm-12 col-md-12 col-lg-12 col-xl-9 col-xxl-9",
      # div(
      #   id = ns("card_placeholder_participant_domain_data"),
      #   class = "card mb-3",
      #   div(
      #     class = "card-body",
      #     h5(class = "card-title", "Participant Domain"),
      #     hr(),
      #     div(
      #       class = "card placeholder",
      #       div(
      #         class = "card-body",
      #         div(
      #           class = "card-text",
      #           "Please select a participant."
      #         )
      #       )
      #     )
      #   )
      # ),
      # shinyjs::hidden(
      #   div(
      #     id = ns("card_placeholder_participant_domain_data_no_metric"),
      #     class = "card mb-3",
      #     div(
      #       class = "card-body",
      #       h5(class = "card-title", "Participant Domain"),
      #       hr(),
      #       div(
      #         class = "card placeholder",
      #         div(
      #           class = "card-body",
      #           div(
      #             class = "card-text",
      #             "Please select a metric in the Metric Summary Card above."
      #           )
      #         )
      #       )
      #     )
      #   )
      # ),
    # shinyjs::hidden(
        div(
          id = ns("card_participant_domain_data"),
          class = "card mb-3",
          style = "max-width: auto;",
          div(
            class = "card-body",
            h5(class = "card-title", "Participant Domain"),
            tableOutput(ns("domain_data_table"))
          )
        )
    # )
    )
  )

  return(ui)
}
