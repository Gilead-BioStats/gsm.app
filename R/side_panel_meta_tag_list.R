#' Meta Tag List for Side Panel
#'
#' @param snapshot The snapshot `list` object passed from `run_app()`
#'
#' @export


side_panel_meta_tag_list <- function(snapshot) {

    meta <- snapshot$lInputs$lMeta$meta_study

    meta <- meta |>
        dplyr::select("protocol_indication",
               "therapeutic_area",
               "phase",
               "num_plan_site",
               "num_enrolled_subj_m")

    colnames(meta) <- c("Indication", "TA", "Phase", "Sites", "Subjects")

    meta_tags <- colnames(meta) |>
        purrr::map(function(x) tags$div(
            class = "col-12",
            style = "font-weight: 500;",
            tags$div(style = "display: flex; justify-content: space-between;",
                     tags$div(class = "card-text",
                              style = "text-align: left; white-space: nowrap;", x),
                     tags$div(class = "text-secondary", style = "border-bottom: 1px dotted; width: 95%; margin-bottom: .4em; margin-right: .4em; margin-left: .4em;"),
                     tags$div(class = "card-text", style = "text-align: right; white-space: nowrap;", meta[x]))
        )) |>
        tags$div(
            class = "row p-2"
        ) |>
        tagList()

    return(meta_tags)
}


