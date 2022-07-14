#' Structure {gsm} Metadata
#'
#' Map {gsm} metadata to the tabular structure expected by {safetyGraphics}
#'
#' @param meta_in `list` {gsm} metadata
#'
#' @import dplyr
#' @importFrom purrr map_df
#' @importFrom rlang syms
#' @importFrom tidyr pivot_longer
#' @importFrom tidyselect everything
#'
#' @return `data.frame` {gsm} metadata in tabular form expected by {safetyGraphics}
#'
#' @examples
#' meta_safetyGraphics <- map_meta_to_safetyGraphics()
#'
#' @export

map_meta_to_safetyGraphics <- function(
    meta_in = system.file('mappings', 'mapping_rawplus.yaml', package = 'gsm') %>% read_yaml() # clindata::mapping_rawplus
) {
    # For each data domain in the metadata:
    meta_out <- names(meta_in) %>%
        purrr::map_df(function(domain) {
            meta_in[[ domain ]] %>%
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
        select(domain, name, col_key, type, value, field_key, text_key, label, description, standard_gsm, multiple) %>%
        arrange(domain, col_key, type, field_key)

    # Add an additional row for each domain that renames 'strIDCol' to 'id_col' for compatibility
    # with {safetyGraphics}.
    id_col <- meta_out %>%
        filter(
            text_key == 'strIDCol'
        ) %>%
        mutate(
            col_key = 'id_col',
            text_key = 'id_col',
            label = 'Subject ID',
            description = 'Unique Subject Identifier'
        )

    meta_out %>%
        bind_rows(id_col) %>%
        #select(domain, col_key, type, field_key, text_key, label, description, standard_gsm, multiple) %>%
        arrange(domain, col_key, type, field_key)
}
