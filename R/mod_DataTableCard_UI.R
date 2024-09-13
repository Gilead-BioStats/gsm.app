mod_DataTableCard_UI <- function(id) {
  ns <- NS(id)
  bslib::card(
    full_screen = TRUE,
    bslib::card_title(textOutput(ns("title"), inline = TRUE)),
    DT::DTOutput(ns("table"), fill = FALSE)
  )
}
