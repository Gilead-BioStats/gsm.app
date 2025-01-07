#' Domain Details server
#'
#' Update Domain Details when the selected participant changes.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactive()] with the ids of rows selected in the table
#'   (currently unused but implemented as a proof-of-concept for future
#'   extensions).
#' @keywords internal
mod_DomainDetails_Server <- function(
  id,
  fnFetchData,
  chrDomains = c(
    "AE", "ENROLL", "LB", "PD", "SDRGCOMP", "STUDCOMP",
    "SUBJ", "DATACHG", "DATAENT", "QUERY"
  ),
  rctv_strSiteID,
  rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    # Reactives ----
    rctv_lDomainData <- reactive({
      SiteID <- null_for_none(rctv_strSiteID())
      SubjectID <- null_for_none(rctv_strSubjectID())
      if (!is.null(SiteID) || !is.null(SubjectID)) {
        withProgress(
          message = "Loading domain data",
          {
            lDomains <- purrr::map(chrDomains, function(this_domain) {
              fnFetchData(
                this_domain,
                strSiteID = SiteID,
                strSubjectID = SubjectID
              )
            })
            names(lDomains) <- chrDomains
            applyPrettyDomainNames(lDomains)
          }
        )
      }
    }) %>%
      shiny::bindCache(
        rctv_strSiteID(),
        rctv_strSubjectID()
      )

    # Output ----
    shiny::observe({
      mod_DomainData_Server(
        id = input$selected_tab,
        rctv_lDomainData,
        rctv_strSubjectID
      )
    })

    return(shiny::reactive(input$selected_tab))
  })
}
