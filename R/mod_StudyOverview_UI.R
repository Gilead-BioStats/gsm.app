#' Study Overview UI
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_StudyOverview_UI <- function(id, dfResults) {
  ns <- NS(id)
  tags_to_return <- bslib::navset_pill(
    bslib::nav_panel(
      title = "Overview Table",
      bslib::card(
        bslib::card_body(
          out_KRIColor(dfResults),
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
