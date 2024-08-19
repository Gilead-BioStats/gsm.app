#' Synchronize participant drop-down with click input
#'
#' When a user clicks a participant on `table_participants_by_site`, also update the drop-down menu to
#' match.
#'
#' @inheritParams shared-params
#'
#' @return An observer (see  [shiny::observe()]) that updates the participant drop-down
#'   menu whenever the input value changes.
#' @keywords internal
sync_participant_input <- function(rctv_strParticipant) {
  # Update participant input when client-side selection occurs.
  shiny::observe({

    shiny::updateSelectInput(
      inputId = "participant",
      selected = rctv_strParticipant()
    )

    # Changes tab on drill down
    if (rctv_strParticipant() != "None" && rctv_strParticipant() != "") {
      bslib::nav_select("primary_nav_bar", "Participant Details")
    }

  })

}
