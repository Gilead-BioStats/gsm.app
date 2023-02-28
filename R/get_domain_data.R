get_domain_data <- function(domain_data, domains) {
    # TODO: use gsm::mapping_domain
    # By default, use domain data from {clindata} as a fallback.
    if (is.null(domain_data)) {
        domain_data <- domains %>%
            purrr::map(function(domain) {
                standard <- 'rawplus'
                domain <- domain %>%
                    sub('SUBJ', 'DM', .) %>%
                    sub('PD', 'PROTDEV', .)

                # TODO: avoid hard-coding standard and manipulating domain names
                if (domain %in% c('dfDATACHG', 'dfDATAENT', 'dfQUERY')) {
                    standard <- 'edc'

                    domain <- domain %>%
                        sub('DATAENT', 'data_entry_lag', .) %>%
                        sub('DATACHG', 'data_change_rate', .) %>%
                        sub('QUERY', 'queries', .)
                }

                do.call(
                    `::`,
                    list(
                        'clindata',
                        paste0(standard, '_', sub('^df', '', domain) %>% tolower)
                    )
                )
            }) %>%
            purrr::set_names(domains)
    }

    domain_data
}
