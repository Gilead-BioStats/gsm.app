#' Creates taglist to summarize participants at a particular site
#' @param combinedData `data.frame` A combined data set with the required metrics.
#' @import shiny
#' @import stringr
#' @export
#' @keywords internal

site_details_meta_data_list <- function(meta_data = NULL, enrolled_subjects = NULL) {

    req(meta_data)
   # req(enrolled_subjects)

    meta_data <- meta_data |>
        transmute("Site ID" = site_num,
               "Investigator" = str_trunc(paste0(pi_last_name, ", ", pi_first_name), 25),
               "City" = city,
               "State" = state,
               "Country" = country,
               "Enrolled Subjects" = length(unique(enrolled_subjects)))

    meta_data <- as.list(meta_data)

    tag_return <- names(meta_data) |>
        map(function(x) tags$div(
            class = "col-12",
            style = "font-weight: 500;",
            tags$div(style = "display: flex; justify-content: space-between;",
                     tags$div(class = "card-text",
                              style = "text-align: left; white-space: nowrap;", x),
                     tags$div(class = "text-secondary", style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
                     tags$div(class = "card-text", style = "text-align: right; white-space: nowrap;", meta_data[x]))
        )) |>
        tags$div(
            class = "row p-2"
        ) |>
        tagList()

    return(tag_return)

}
