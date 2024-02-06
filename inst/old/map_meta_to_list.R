#' Structure {gsm} Metadata
#'
#' Map {safetyGraphics} metadata to the list structure expected by {gsm}
#'
#' @param meta_in `data.frame` {safetyGraphics} metadata
#'
#' @import dplyr
#' @importFrom purrr map_df
#' @importFrom rlang syms
#' @importFrom tidyr pivot_longer
#' @importFrom tidyselect everything
#'
#' @return `list` metadata from {safetyGraphics} in list form expected by {gsm}
#'
#' @examples
#' meta_gsm <- map_meta_to_list()
#'
#' @export

map_meta_to_list <- function(meta_in = gsmApp::meta_safetyGraphics) {
    domains <- unique(meta_in$domain)

    meta_out <- domains %>%
        map(function(domain) {
            meta_df <- meta_in %>%
                filter(
                    .data$domain == !!domain
                )

            mappings <- unique(meta_df$key)

            meta <- mappings %>%
                map(function(mapping) {
                    meta_df %>%
                        filter(
                            .data$key == !!mapping
                        ) %>%
                        pull(value) %>%
                        unique()
                }) %>%
                set_names(mappings)

            meta
        }) %>%
        set_names(domains)

    meta_out
}
