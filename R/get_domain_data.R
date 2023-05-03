get_domain_data <- function(domain_data, domains, meta) {
    # TODO: use gsm::mapping_domain
    # By default, use domain data from {clindata} as a fallback.
    if (is.null(domain_data)) {
        domain_data <- domains %>%
            purrr::map(function(domain) {
                standard <- 'rawplus'
                domain <- domain %>%
                    sub('SUBJ', 'DM', .)

                if (domain %in% c('dfPD')) {
                    standard <- 'ctms'

                    domain <- domain %>%
                        sub('PD', 'PROTDEV', .)
                }

                # TODO: avoid hard-coding standard and manipulating domain names
                if (domain %in% c('dfDATACHG', 'dfDATAENT', 'dfQUERY')) {
                    standard <- 'edc'

                    domain <- domain %>%
                        sub('DATAENT', 'data_pages', .) %>%
                        sub('DATACHG', 'data_points', .) %>%
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

    #browser()
    ## TODO: merge dfSUBJ$strIDCol onto other data domains to allow filter module to work
    #for (domain in domains) {
    #    if (all(
    #        domain %in% names(meta),
    #        domain %in% names(domain_data),
    #        !(meta$dfSUBJ$strIDCol %in% names(domain_data[[ domain ]]))
    #    )) {
    #        domain_data[[ domain ]] <- domain_data[[ domain ]] %>%
    #            left_join(
    #                domain_data$dfSUBJ,
    #                c(meta[[ domain ]]$strIDCol = meta$dfSUBJ$strIDCol) # TODO: should be EDC.strIDCol = dfSUBJ$strEDCIDCol
    #            )
    #    }
    #}

    domain_data
}
