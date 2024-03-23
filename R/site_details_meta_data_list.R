#' Creates taglist to summarize participants at a particular site
#' @param combinedData `data.frame` A combined data set with the required metrics.
#' @import shiny
#' @import stringr
#' @export
#' @keywords internal

site_details_meta_data_list <- function(meta_data = NULL, enrolled_subjects = NULL, participant_list = NULL) {
  req(meta_data)
  req(participant_list)
  # req(enrolled_subjects)

  meta_data <- meta_data %>%
      dplyr::mutate(
          "Site ID" = .data$site_num,
          "Investigator" = str_trunc(paste0(
              .data$pi_last_name, ", ", .data$pi_first_name
          ), 25),
          "City" = .data$city,
          "State" = .data$state,
          "Country" = .data$country
      ) %>%
      dplyr::select("Site ID",
                    "Investigator",
                    "City",
                    "State",
                    "Country") %>%
      as.list()

  tag_return <- names(meta_data) %>%
    map(function(x) {
      tags$div(
        class = "col-12",
        style = "font-weight: 500;",
        tags$div(
          style = "display: flex; justify-content: space-between;",
          tags$div(
            class = "card-text",
            style = "text-align: left; white-space: nowrap;", x
          ),
          tags$div(class = "text-secondary", style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
          tags$div(class = "card-text", style = "text-align: right; white-space: nowrap;", meta_data[x])
        )
      )
    }) %>%
    tags$div(
      class = "row px-2"
    )

  tag_return <- tagList(
    tag_return,
    participant_status_nest_list(participant_list)
  )

  return(tag_return)
}
