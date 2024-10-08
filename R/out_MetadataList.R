#' Metadata list card
#'
#' @inheritParams shared-params
#' @returns A [htmltools::tagList()] of label-value pairs, including the CSS
#'   needed to lay them out properly.
#' @keywords internal
out_MetadataList <- function(chrLabels, chrValues) {
  tagList(
    htmlDependency_Stylesheet("metadata.css"),
    !!!purrr::map2(
      chrLabels, chrValues,
      out_MetadataItem
    )
  )
}

#' Metadata list item
#'
#' @inheritParams shared-params
#' @returns A [htmltools::div()] with the label, a spacer, and the value.
#' @keywords internal
out_MetadataItem <- function(strLabel, strValue) {
  div(
    class = "metadata-list-item",
    div(class = "metadata-list-item-label", strLabel),
    div(class = "metadata-list-item-spacer"),
    div(class = "metadata-list-item-value", strValue)
  )
}
