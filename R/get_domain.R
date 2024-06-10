#' Get Domain Mapping and Data
#'
#' @param snapshot The snapshot `list` object that is passed from `run_app()`
#' @param domain The type of data and subsequent metrics you would like to see.
#' @param subset_col The id column that will be selected from the domain.
#' @param subset_val The specific value that the subset_col will be filtered by.
#'
#' @export

get_domain <- function(
    snapshot,
    domain,
    subset_col = NULL,
    subset_val = NULL
) {
    if (!is.null(subset_val)) {
        shiny::req(subset_val)
    }

    mapping <- snapshot$lInputs$lMapping[[domain]]
    data <- snapshot$lInputs$lData[[domain]]

    if (!is.null(subset_col) && !is.null(subset_val)) {
        data <- data %>%
            dplyr::filter(
                .data[[
                    mapping[[subset_col]]
                ]] %in% !!subset_val
            )
    }

    return(list(
        mapping = mapping,
        data = data
    ))
}
