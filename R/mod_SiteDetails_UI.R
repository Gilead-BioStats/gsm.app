#' Site Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_SiteDetails_UI <- function(id) {
  ns <- NS(id)

  ui <- fluidRow(
    shinyjs::useShinyjs(),
    column(
      width = 5,
      # Metric Metadata (never hidden, no "unselected" state)
      uiOutput(ns("metric_metadata_list")),
      # Site Details
      #
      # TODO: Replace with a single module.
      shinyjs::hidden(
        out_Card(
          "Site Metadata",
          p(
            uiOutput(ns("site_metadata_list"))
          ),
          strID = ns("card_site_metadata_list")
        )
      ),
      out_Card(
        "Site Details",
        out_Placeholder("site"),
        strID = ns("card_placeholder_site_metadata_list")
      )
    ),
    column(
      width = 7,
      # Site participants
      #
      # TODO: Replace with a single module.
      shinyjs::hidden(
        bslib::card(
          bslib::card_header(
            bslib::card_title(
              textOutput(ns("participant_table_title"), inline = TRUE)
            ),
            p(class = "card-subtitle", "Select a subject below to drill-down")
          ),
          bslib::card_body(DT::DTOutput(ns("participants"))),
          id = ns("card_participants")
        )
      ),
      out_Card(
        "Site Subjects",
        out_Placeholder("site"),
        strID = ns("card_placeholder_participants")
      )
    )
  )

  return(ui)
}
