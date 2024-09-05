out_MetadataList <- function(chrLabels, chrValues) {
  tagList(
    purrr::map2(
      chrLabels, chrValues,
      out_MetadataItem
    )
  )
}

out_MetadataItem <- function(strLabel, strValue) {
  div(
    class = "metadata-list-item",
    div(class = "metadata-list-item-label", strLabel),
    div(class = "metadata-list-item-spacer"),
    div(class = "metadata-list-item-value", strValue)
  )
}
