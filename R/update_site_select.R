#' Update Site Select
#'
#' @param input Shiny inputs
#' @param output Shiny outputs
#' @param session Shiny session
#' @param snapshot The snapshot `list` object passed from `run_app()`
#'
#' @export

update_site_select <- function(input, output, session, snapshot) {
  # Update site input when client-side selection occurs.
  shiny::observeEvent(input$site, {
    cli::cli_alert_info(
      "Selected site: {input$site}"
    )

    shiny::updateSelectInput(
      session,
      "site",
      selected = input$site
    )
  })

  # Capture list of site IDs.
  site_metadata <- snapshot$lInputs$lMeta$meta_site %>%
    dplyr::filter(
      .data[[snapshot$lInputs$lMapping$dfSITE$strSiteCol]] %in% (
        snapshot$lInputs$lData$dfSUBJ[[
          snapshot$lInputs$lMapping$dfSUBJ$strSiteCol
        ]] %>%
          unique() %>%
          sort()
      )
    ) %>%
    dplyr::arrange(
      .data[[snapshot$lInputs$lMapping$dfSITE$strSiteCol]]
    )

  # Include investigator name in each option.
  choices <- site_metadata[[snapshot$lInputs$lMapping$dfSITE$strSiteCol]] %>%
    stats::setNames(
      glue::glue(
        "{
                    site_metadata[[ snapshot$lInputs$lMapping$dfSITE$strSiteCol ]]
                } ({
                    site_metadata[[ snapshot$lInputs$lMapping$dfSITE$strPILastNameCol ]]
                })"
      )
    )

  shiny::updateSelectInput(
    session,
    "site",
    choices = c(
      "None",
      choices
    )
  )
}
