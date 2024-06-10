#' Update Participant Select
#'
#' @param input Shiny inputs
#' @param output Shiny outputs
#' @param session Shiny session
#' @param snapshot The snapshot `list` object passed from `run_app()`
#' @param site The user-selected site.
#'
#' @export

update_participant_select <- function(input, output, session, snapshot, site) {
  # Update participant input when client-side selection occurs.
  shiny::observeEvent(input$participant, {
    cli::cli_alert_info(
      "Selected participant: {input$participant}"
    )

    shiny::updateSelectInput(
      session,
      "participant",
      selected = input$participant
    )
  })

  participant_metadata <- snapshot$lInputs$lData$dfSUBJ

  if (site != "None") {
    participant_metadata <- participant_metadata %>%
      dplyr::filter(
        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strSiteCol ]] == site
      ) %>%
      dplyr::filter(
        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol ]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
      ) %>%
      dplyr::arrange(
        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]
      )
  } else {
    participant_metadata <- participant_metadata %>%
      dplyr::filter(
        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strEnrollCol ]] == snapshot$lInputs$lMapping$dfSUBJ$strEnrollVal
      ) %>%
      dplyr::arrange(
        .data[[ snapshot$lInputs$lMapping$dfSUBJ$strIDCol ]]
      )
  }

  choices <- participant_metadata[[snapshot$lInputs$lMapping$dfSUBJ$strIDCol]]

  shiny::updateSelectizeInput(
    session,
    "participant",
    choices = c(
      "None",
      choices
    ),
    server = TRUE
  )
}
