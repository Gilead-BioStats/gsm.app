#' Creates taglist to showcase all metadata associate with a site.
#' @inheritParams shared-params
#' @keywords internal
taglist_site_meta_data <- function(dfGroups, strSiteID) {
  sub_dfGroups <- dfGroups %>%
    dplyr::filter(.data$GroupLevel == "Site", .data$GroupID == strSiteID)

  return_tags <- column(
    width = 12,
    lapply(1:length(sub_dfGroups$Param), function(i) {
      div(
        class = "metadata-list-item",
        div(
          class = "metadata-list-item-label",
          gsm::MakeParamLabelsList(sub_dfGroups[i, "Param"])
        ),
        div(class = "metadata-list-item-spacer"),
        div(
          class = "metadata-list-item-value",
          sub_dfGroups[i, "Value"]
        )
      )
    })
  )
  return(return_tags)
}
