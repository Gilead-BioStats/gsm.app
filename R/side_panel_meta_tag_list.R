#' Meta Tag List for Side Panel
#'
#' @inheritParams shared-params
#'
#' @keywords internal
side_panel_meta_tag_list <- function(dfStudy) {
  dfStudyFiltered <- dfStudy %>%
    dplyr::filter(.data$Param %in% c(
      "protocol_indication",
      "therapeutic_area",
      "phase",
      "num_plan_site",
      "num_enrolled_subj_m"
    )) %>%
    dplyr::select("Param", "Value") %>%
    tidyr::pivot_wider(names_from = "Param", values_from = "Value") %>%
    dplyr::select(
      Indication = "protocol_indication",
      TA = "therapeutic_area",
      Phase = "phase",
      Sites = "num_plan_site",
      Subjects = "num_enrolled_subj_m"
    )

  meta_tags <- colnames(dfStudyFiltered) %>%
    purrr::map(function(x) {
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
          tags$div(class = "card-text", style = "text-align: right; white-space: nowrap;", dfStudyFiltered[x])
        )
      )
    }) %>%
    tags$div(
      class = "row p-2"
    ) %>%
    htmltools::tagList()

  return(meta_tags)
}
