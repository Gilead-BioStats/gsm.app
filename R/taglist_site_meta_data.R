#' Creates taglist to showcase all metadata associate with a site.
#' @inheritParams shared-params
#' @export
#' @keywords internal
taglist_site_meta_data <- function(dfGroups, strSiteID) {

  sub_dfGroups <- dfGroups %>%
    dplyr::filter(.data$GroupLevel == "Site",
                  .data$GroupID == strSiteID)

  return_tags <- tagList(

    tags$div(
      class = "col-12",
      lapply(1:length(sub_dfGroups$Param), function(i) {

        tags$div(
          style = "display: flex; justify-content: space-between;",
          tags$div(class = "card-text",
                   style = "text-align: left; white-space: nowrap;",
                   sub_dfGroups[i, "Param"]),
          tags$div(class = "text-secondary",
                   style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
          tags$div(class = "card-text", style = "text-align: right; white-space: nowrap;", sub_dfGroups[i, "Value"])
        )


      })
    )
  )

  return(return_tags)
}
