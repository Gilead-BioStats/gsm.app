mod_DynamicLabelKey_UI <- function(id) {
  ns <- NS(id)
  span(
    id = id,
    "by",
    uiOutput(ns("key"), inline = TRUE),
    htmlDependency_Stylesheet("labelKey.css")
  )
}

mod_DynamicLabelKey_Server <- function(id, l_rctvLabels) {
  moduleServer(id, function(input, output, session) {
    output$key <- shiny::renderUI({
      chrLabels <- purrr::imap(
        l_rctvLabels,
        function(strLabel, strName) {
          if (is.reactive(strLabel)) {
            strLabel <- strLabel()
          }
          if (length(strLabel)) {
            strColor <- strName
            glue::glue(
              '<span class="label-key" style="background-color:{strName};">{strLabel}</span>'
            )
          }
        }
      )
      chrLabels <- purrr::compact(chrLabels)
      HTML(cli::format_inline("{chrLabels}"))
    })
  })
}
