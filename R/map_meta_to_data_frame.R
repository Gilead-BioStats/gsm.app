#' Structure {gsm} Metadata
#'
#' Map {gsm} metadata to the tabular structure expected by {safetyGraphics}
#'
#' @param meta_in `list` {gsm} domain/column/value mapping metadata with structure:
#' domain:
#'   key: value
#'
#' @import dplyr
#' @importFrom purrr imap list_rbind
#' @importFrom rlang syms
#' @importFrom tibble tibble
#' @importFrom tidyr pivot_longer
#' @importFrom tidyselect everything
#' @importFrom yaml read_yaml
#'
#' @return `data.frame` {gsm} metadata in tabular form expected by {safetyGraphics}
#'
#' @examples
#' meta <- map_meta_to_data_frame()
#'
#' @export

map_meta_to_data_frame <- function(
    meta_in = c(
        yaml::read_yaml(system.file('mappings', 'mapping_rawplus.yaml', package = 'gsm')),
        yaml::read_yaml(system.file('mappings', 'mapping_edc.yaml', package = 'gsm'))
    )
) {
    # For each data domain in the metadata:
    meta_out <- names(meta_in) %>%
        purrr::map_df(function(domain) {
            meta_df <- meta_in[[ domain ]] %>%
                purrr::imap(function(value, key) {
                    tibble::tibble(
                        key = key,
                        value = as.character(value)
                    )
                }) %>%
                purrr::list_rbind()

            meta_df1 <- meta_df %>%
                mutate(
                    domain = !!domain,
                    # mapping type
                    type = case_when(
                        grepl('Col$', key) ~ 'column',
                        grepl('Val$', key) ~ 'field'
                    ),
                    # column key
                    col_key = if_else(
                        type == 'column',
                        key,
                        # Associate value mapping with corresponding column mapping.
                        key %>%
                            sub('Val$', 'Col', .) %>%
                            sub('NonSerious', 'Serious', .) %>%
                            sub('NonImportant', 'Important', .) %>%
                            sub('GradeAny', 'Grade', .) %>%
                            sub('GradeHigh', 'Grade', .)
                    ),
                #) %>%
                #group_by(key) %>%
                #mutate(
                    # field key
                    field_key = case_when(
                        type == 'column' ~ '',
                        type == 'field' ~ gsub('^str|Val$', '', key) %>%
                            paste(value),
                        #type == 'field' & n() == 1 ~ gsub('^str|Val$', '', key),
                        #type == 'field' & n() >= 2 ~ gsub('^str|Val$', '', key) %>%
                        #    paste0(row_number())
                    ),
                #) %>%
                #ungroup() %>%
                #mutate(
                    text_key = if_else(
                        type == 'column',
                        col_key,
                        paste0(key, '--', field_key)
                    ),
                    label = text_key %>%
                        sub('^[a-z]*', '', .) %>% # remove type prefix
                        gsub('([a-z]|ID)([A-Z])', '\\1 \\2', ., perl = TRUE) %>% # camelCase to camel Case
                        sub('--', ': ', .) %>%
                        sub('Col', 'Column', .) %>%
                        sub('Val', 'Value', .),
                    description = label,
                    standard_gsm = value,
                    multiple = FALSE
                )

            return(meta_df1)
        }) %>%
        distinct() %>%
        select(domain, key, value, col_key, type, value, field_key, text_key, label, description, standard_gsm, multiple) %>%
        arrange(domain, col_key, type, key, field_key)

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
        arrange(domain, col_key, type, field_key)
}
