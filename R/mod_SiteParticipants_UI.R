mod_SiteParticipants_UI <- function(id) {
  ns <- NS(id)
  bslib::card(
    bslib::card_header(
      bslib::card_title(glue::glue("Site {strGroupID}")),
      out_CardSubtitle("Select a subject below to drill down.")
    )
  )



  out_Card(
    tagTitle = textOutput(ns("title"), inline = TRUE),
    # Server chooses between placeholder card & gt table.
    uiOutput(ns("table")),
    id = ns("card")
  )
}
