#' Site Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_site_details_ui <- function(id) {
  ns <- NS(id)

  ui <- shiny::fluidRow(
    shinyjs::useShinyjs(),
    shiny::column(
      width = 5,
      # Metric Metadata (never hidden, no "unselected" state)
      bslib::card(
        bslib::card_title("Metric Metadata"),
        bslib::card_body(
          p(
            class = "card-text",
            uiOutput(ns("metric_metadata_list"))
          )
        )
      ),
      # Site Details
      #
      # TODO: Replace with a single module.
      shinyjs::hidden(
        bslib::card(
          id = ns("card_site_metadata_list"),
          bslib::card_title("Site Metadata"),
          bslib::card_body(
            p(
              class = "card-text",
              uiOutput(ns("site_metadata_list"))
            )
          )
        )
      ),
      html_CardPlaceholder(
        ns("card_placeholder_site_metadata_list"),
        "Site Details",
        "site"
      )
    ),
    shiny::column(
      width = 7,
      # Site participants
      #
      # TODO: Replace with a single module.
      shinyjs::hidden(
        bslib::card(
          id = ns("card_participants"),
          bslib::card_title(uiOutput(ns("participant_table_title"))),
          bslib::card_body(DT::DTOutput(ns("participants")))
        )
      ),
      html_CardPlaceholder(
        ns("card_placeholder_participants"),
        "Site Subjects",
        "site"
      )
    )
  )

  return(ui)
}
