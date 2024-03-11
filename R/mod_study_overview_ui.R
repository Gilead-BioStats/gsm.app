#' Study Overview UI
#'
#' @param id A namespace id
#'
#' @export

study_overview_ui <- function(id) {
  ns <- shiny::NS(id)
  study_card <- tagList(
    div(
      class = "card mb-3",
      style = "border-top: solid #0dcaf0;",
      div(
        class = "card-body",
        style = "overflow-x: auto;",
        h4(class = "card-title", "Overview"),
        div(
          style = "padding-bottom: 1em;",
          span(
            class = "badge rounded-pill text-dark",
            style = "background-color: #ffccc74d; font-size: 1.01em; padding: .55em",
            textOutput(ns("red_kri"), inline = TRUE)
          ),
          span(
            class = "badge rounded-pill text-dark",
            style = "background-color: #fffdf1; font-size: 1.05em; padding: .55em",
            textOutput(ns("amber_kri"), inline = TRUE)
          )
        ),
        DT::DTOutput(ns("site_overview_table"))
      )
    )
  )

  return(study_card)
}
