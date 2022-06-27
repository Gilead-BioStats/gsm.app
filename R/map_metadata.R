#' Structure {gsm} Metadata
#'
#' Map {gsm} metadata to the tabular structure expected by {safetyGraphics}
#'
#' @param meta `list` clindata::mapping_rawplus
#'
#' @import dplyr
#' @importFrom purrr map_df
#' @importFrom rlang syms
#' @importFrom tidyr pivot_longer
#' @importFrom tidyselect everything
#'
#' @return `data.frame` {gsm} metadata in tabular form
#'
#' @examples
#' metadata <- map_metadata()
#'
#' @export

map_metadata <- function(meta = clindata::mapping_rawplus) {
    # For each data domain in the metadata:
    metadata_tabular <- names(meta) %>%
        purrr::map_df(function(domain) {
            purrr::map_df(meta[[ domain ]], ~as.character(.x)) %>% 
                tidyr::pivot_longer(everything()) %>%
                mutate(
                    domain = !!domain,
                    text_key = name,
                    type = if_else(
                        grepl('Col$', name),
                        "column",
                        "field"
                    ),
                    col_key = if_else(
                        type == 'column',
                        text_key,
                        sub('Val.*$', 'Col', text_key)
                    ),
                    field_key = if_else(
                        type == 'column',
                        '',
                        text_key
                    ),
                    label = name,
                    description = name,
                    standard_gsm = value
                )
        }) %>%
        group_by(!!!syms(names(.) %>% .[. != 'standard_gsm'])) %>%
        summarize(
            standard_gsm = paste(unique(standard_gsm), collapse = ', ')
        ) %>%
        ungroup %>%
        arrange(domain, col_key, text_key) %>%
        filter(type != 'field') # TODO: figure out how to pass fields to safetyGraphics

    # Add an additional row for each domain that renames 'strIDCol' to 'id_col' for compatibility
    # with {safetyGraphics}.
    id_col <- metadata_tabular %>%
        filter(
            text_key == 'strIDCol'
        ) %>%
        mutate(
            col_key = 'id_col',
            text_key = 'id_col',
            label = 'Subject ID',
            description = 'Unique Subject Identifier'
        )

    metadata_tabular %>%
        bind_rows(id_col) %>%
        select(
            domain, text_key, value, col_key, field_key, type, label, description, standard_gsm
        ) %>%
        arrange(
            domain, text_key
        )
}
