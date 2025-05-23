#' Metadata list card
#'
#' Display label-value pairs as a vertical list, with a consistent spacer
#' between the label and value.
#'
#' @inheritParams shared-params
#' @returns A [htmltools::tagList()] of label-value pairs, including the CSS
#'   needed to lay them out properly.
#' @export
#' @examples
#' out_MetadataList(
#'   c("value 1", "value 2", "value 3"),
#'   c("Thing 1", "Thing 2", "Thing 3")
#' )
out_MetadataList <- function(chrValues, chrLabels = names(chrValues)) {
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
