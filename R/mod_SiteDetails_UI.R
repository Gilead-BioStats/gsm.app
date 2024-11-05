#' Site Details UI
#'
#' @inheritParams shared-params
#' @returns A [bslib::layout_columns()] with site metadata and site participants.
#' @keywords internal
mod_SiteDetails_UI <- function(id) {
  ns <- NS(id)
  bslib::layout_columns(
    col_widths = c(5, 7),
    tagList(
      # TODO: Replace with a single module.
      shinyjs::hidden(
        out_Card(
          "Site Metadata",
          uiOutput(ns("site_metadata_list")),
          id = ns("card_site_metadata_list")
        )
      ),
      out_Card(
        "Site Metadata",
        out_Placeholder("site"),
        id = ns("card_placeholder_site_metadata_list")
      )
    ),
    mod_SiteParticipants_UI(ns("participants"))
  )
}
