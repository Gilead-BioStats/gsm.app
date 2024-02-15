#' Get Domain Mapping and Data
#'
#' @export

get_domain <- function(
        snapshot,
        domain,
        subset_col = NULL,
        subset_val = NULL
) {

        if (!is.null(subset_val))
            shiny::req(subset_val)

        mapping <- snapshot$lInputs$lMapping[[ domain ]]
        data <- snapshot$lInputs$lData[[ domain ]]

        if (!is.null(subset_col) && !is.null(subset_val)) {
            data <- data %>%
                dplyr::filter(
                    .data[[
                        mapping[[ subset_col ]]
                    ]] %in% !!subset_val
                )
        }

        return(list(
            mapping = mapping,
            data = data
        ))

}
