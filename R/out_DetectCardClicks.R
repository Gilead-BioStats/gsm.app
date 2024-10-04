#' Card click detection JavaScript
#'
#' @inheritParams shared-params
#'
#' @returns A [shiny::tagList()] with the JavaScript required to enable card
#'   click detection within the specified container. Clicks will be reported to
#'   the Shiny input named `strInputID`.
#' @keywords internal
out_DetectCardClicks <- function(strContainerID, strInputID) {
  tagList(
    htmlDependency_DetectCardClicks(),
    tags$script(
      HTML(sprintf(
        "detectCardClicks('%s', '%s')",
        strContainerID,
        strInputID
      ))
    )
  )
}
