#' Site Details UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_site_details_ui <- function(id) {
  ns <- NS(id)

  ui <- fluidRow(
    shinyjs::useShinyjs(),
    column(
      width = 5,
      # Metric Metadata (never hidden, no "unselected" state)
      out_Card(
        "Metric Metadata",
        p(uiOutput(ns("metric_metadata_list")))
      ),
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
        out_Card(
          uiOutput(ns("participant_table_title")),
          bslib::card_body(DT::DTOutput(ns("participants"))),
          strID = ns("card_participants")
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
