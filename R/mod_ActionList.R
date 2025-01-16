#' List of ActionLinks UI
#'
#' Display a vertical list of [shiny::actionLink()] items, along with a
#' corresponding vertical list of values associated with those links.
#'
#' @inheritParams shared-params
#' @returns A [htmltools::tagList()] of labels and values, where the labels are
#'   [shiny::actionLink()] items.
#' @export
#' @examples
#' mod_ActionList_UI(
#'   "demo",
#'   c("link1", "link2", "link3"),
#'   c("Label 1", "Label 2", "Label 3"),
#'   c("value 1", "value 2", "value 3")
#' )
mod_ActionList_UI <- function(id, chrLinkIDs, chrLabels, chrValues) {
  ns <- NS(id)
  links <- purrr::map2(
    chrLinkIDs,
    chrLabels,
    function(strLinkID, strLabel) {
      actionLink(ns(strLinkID), label = strLabel)
    }
  )
  out_MetadataList(chrLabels = links, chrValues = chrValues)
}

#' List of ActionLinks Server
#'
#' The server component for [mod_ActionList_UI()]. This server keeps track of
#' which link was most recently clicked.
#'
#' @inheritParams shared-params
#' @returns A [shiny::reactiveVal()] with the id of the most recently clicked
#'   link.
#' @export
mod_ActionList_Server <- function(id, chrLinkIDs) {
  moduleServer(id, function(input, output, session) {
    lastClickedLink <- reactiveVal(NULL)
    observe({
      lapply(chrLinkIDs, function(name) {
        observe(lastClickedLink(name)) %>%
          bindEvent(input[[name]])
      })
      observe(lastClickedLink(NULL)) %>%
        bindEvent(length(chrLinkIDs) == 0)
    })
    lastClickedLink
  })
}
