#' Study Overview UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_study_overview_ui <- function(id) {
  ns <- NS(id)
  tags_to_return <- tagList(
    tabsetPanel(
      tabPanel(
        title = "Overview Table",
        div(
          class = "card mb-3",
          div(
            class = "card-body",
            style = "overflow-x: auto;",
            h4(class = "card-title", "Overview"),
            div(
              style = "padding-bottom: 1em;",
              span(
                class = "badge rounded-pill text-dark",
                style = "background-color: #ffcccc; font-size: 1.01em; padding: .55em",
                textOutput(ns("red_kri"), inline = TRUE)
              ),
              span(
                class = "badge rounded-pill text-dark",
                style = "background-color: #ffcc99; font-size: 1.05em; padding: .55em",
                textOutput(ns("amber_kri"), inline = TRUE)
              )
            ),
            gsm::Widget_GroupOverviewOutput(ns("site_overview_table"))
          )
        )
      ),
      tabPanel(
        title = "Scatter Plots",
        mod_scatter_ui("scatter")
      ),
      type = "pills"
    )
  )

  return(tags_to_return)
}
