#' Creates taglist to summarize participants at a particular site
#' @param participant_data A combined data set with the required metrics.
#' @export
#' @keywords internal

participant_summary_tag_list <- function(participant_data = NULL) {

    labels <- c("SubjID", "SiteID", participant_data$Characteristic[!participant_data$Characteristic %in% c("SiteID", "SubjID")])

    tag_return <- labels %>%
        purrr::map(function(x) tags$div(
            class = "col-12",
            style = "font-weight: 500;",
            tags$div(style = "display: flex; justify-content: space-between;",
                     tags$div(class = "card-text",
                              style = "text-align: left; white-space: nowrap;", x),
                     tags$div(class = "text-secondary", style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
                     tags$div(class = "card-text", style = "text-align: right; white-space: nowrap;", participant_data[participant_data$Characteristic == x, "Value"]))
        )) %>%
        tags$div(
            class = "row p-2"
        ) %>%
        htmltools::tagList()

    return(tag_return)

}
