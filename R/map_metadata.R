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
            meta[[ domain ]] %>%
                purrr::map_df(~as.character(.x)) %>% 
                tidyr::pivot_longer(tidyselect::everything()) %>%
                mutate(
                    domain = !!domain,
                    type = if_else(
                        grepl('Col$', name),
                        "column",
                        "field"
                    ),
                    col_key = if_else(
                        type == 'column',
                        name,
                        name %>%
                            sub('^v', 'str', .) %>%
                            sub('Val.*$', 'Col', .) %>% # TODO: update rawplus metadata to be consistent and then...
                            sub('ConsentStatus', 'Value', .) %>% # TODO: ...remove hard code
                            sub('ConsentType', 'Type', .) %>% # TODO: ...remove hard code
                            sub('ExpectedResult', 'Value', .) # TODO: ...remove hard code
                    ),
                    field_key = if_else(
                        type == 'field',
                        value,
                        ''
                    ),
                    text_key = if_else(
                        type == 'column',
                        col_key,
                        paste0(sub('Col', 'Values', col_key), '--', field_key)
                    ),
                    label = text_key %>%
                        sub('^[a-z]*', '', .) %>% # remove type prefix
                        gsub('([a-z]|ID)([A-Z])', '\\1 \\2', ., perl = TRUE) %>% # camelCase to camel Case
                        sub('--', ': ', .) %>%
                        sub('Col', 'Column', .),
                    description = label,
                    standard_gsm = value,
                    multiple = FALSE
                )
        }) %>%
        distinct %>%
        select(domain, col_key, type, field_key, text_key, label, description, standard_gsm, multiple) %>%
        arrange(domain, col_key, type, field_key)

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
        select(domain, col_key, type, field_key, text_key, label, description, standard_gsm, multiple) %>%
        arrange(domain, col_key, type, field_key)
}
