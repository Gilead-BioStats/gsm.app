#' List of ActionLinks UI
#'
#' @inheritParams shared-params
#'
#' @return A [htmltools::tagList()] of labels and values, where the labels are
#'   [shiny::actionLink()] items.
#' @keywords internal
mod_ActionList_UI = function(id, chrLinkIDs, chrLabels, chrValues) {
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
