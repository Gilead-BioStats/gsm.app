#' Study Overview UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_StudyOverview_UI <- function(id) {
  ns <- NS(id)
  tags_to_return <- bslib::navset_pill(
    bslib::nav_panel(
      title = "Overview Table",
      bslib::card(
        bslib::card_body(
          div(
            span(
              class = "badge badge-red rounded-pill text-dark",
              textOutput(ns("red_kri"), inline = TRUE)
            ),
            span(
              class = "badge badge-amber rounded-pill text-dark",
              textOutput(ns("amber_kri"), inline = TRUE)
            )
          ),
          gsm::Widget_GroupOverviewOutput(
            ns("site_overview_table"),
            height = "500px"
          )
        )
      )
    ),
    bslib::nav_panel(
      title = "Scatter Plots",
      mod_Scatter_UI("scatter")
    )
  )

  return(tags_to_return)
}
