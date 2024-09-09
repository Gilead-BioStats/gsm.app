#' Synchronize metric drop-down with click input
#'
#' When a user clicks a metric on a plot, also update the drop-down menu to
#' match.
#'
#' @inheritParams shared-params
#'
#' @return An observer (see  [shiny::observe()]) that updates the metric
#'   drop-down menu whenever the input value changes, and navigates the user to
#'   the Metric Details tab.
#' @keywords internal
sync_metric_input <- function(rctv_strMetricID, rctv_strPrimaryNavBar) {
  # Update participant input when client-side selection occurs.
  shiny::observeEvent(
    rctv_strMetricID(),
    {
      updateSelectInput(
        inputId = "metric",
        selected = rctv_strMetricID()
      )

      # Changes tab on drill down
      bslib::nav_select("primary_nav_bar", "Metric Details")
    },
    ignoreInit = TRUE
  )
}
