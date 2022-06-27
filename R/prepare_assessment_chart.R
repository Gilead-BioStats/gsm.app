#' Prepare {gsm} Assessment for Ingestion by {safetyGraphics}
#'
#' Define a chart object with the format expected by {safetyGraphics}, including required data
#' domains, the charting function, and relevnat metadata.
#'
#' @param meta `data.frame` metadata returned by [map_metadata()]
#'
#' @importFrom safetyGraphics prepareChart
#'
#' @examples
#' # Prepare a single assessment.
#' ae_assessment <- prepare_assessment(
#'     map_metadata(),
#'     list(
#'         domain_name = 'ae',
#'         map_function = 'AE_Map_Raw',
#'         assess_function = 'AE_Assess'
#'     )
#' )
#'
#' # Prepare all assesments.
#' assessments <- c('ae', 'pd', 'ie', 'consent') %>%
#'     map(function(domain) {
#'         domain_alt <- toupper(domain)
#'         if (domain == 'consent')
#'             domain_alt = 'Consent'
#'
#'         prepare_assessment(
#'             map_metadata(),
#'             list(
#'                 domain_name = domain,
#'                 map_function = paste0(domain_alt, '_Map_Raw'),
#'                 assess_function = paste0(domain_alt, '_Assess')
#'             )
#'         )
#'     })
#'
#' @export

# TODO: use gsm workflow in run_assessment() instead of manually defining workflow
prepare_assessment_chart <- function(
    meta,
    assessment = list(
        domain_name = NULL,
        map_function = NULL,
        assess_function = NULL
    )
) {
    # check meta
    stopifnot(
        '[ meta ] is not a data frame' =
            is.data.frame(meta)
    )

    # check domain name
    stopifnot(
        '[ assessment$domain_name ] is not a character value' =
            is.character(assessment$domain_name)
    )

    domain <- assessment$domain_name
    domain_alt <- domain
    if (domain_alt == 'CONSENT')
        domain_alt = 'Consent'
    domain_lower <- sub('^df', '', domain) %>% tolower

    # check map function
    stopifnot(
        #'[ assessment$map_function ] is not a function' =
        #    is.function(assessment$map_function),
        '[ assessment$map_function ] is in {gsm} namespace' =
            assessment$map_function %in% as.character(lsf.str('package:gsm'))
    )

    # check assess function
    stopifnot(
        #'[ assessment$assess_function ] is not a function' =
        #    is.function(assessment$assess_function),
        '[ assessment$assess_function ] is in {gsm} namespace' =
            assessment$assess_function %in% as.character(lsf.str('package:gsm'))
    )

    chart_function <- paste0('run_', domain_lower, '_assessment')
    chart_name <- paste0(domain_lower, '_assessment')

    run_assessment <- function(data, settings) {
        # Define list of data frames.
        dfs <- list(
            dfSUBJ = data$dfSUBJ
        )
        dfs[[ domain ]] <- data[[ domain ]]

        # Run {gsm} data mapping function.
        input <- get(assessment$map_function, envir = as.environment('package:gsm'))(
            dfs = dfs,
            lMapping = clindata::mapping_rawplus # TODO: convert settings to mapping
        )

        # Run {gsm} assessment function.
        result <- get(assessment$assess_function, envir = as.environment('package:gsm'))(input)

        return(result$chart)
    }

    # Assign charting function to global environment where {safetyGraphics} will find it.
    assign(
        chart_function,
        run_assessment,
        envir = .GlobalEnv
    )

    # Define chart object.
    assessment_sg <- list(
        env = "safetyGraphics",
        name = chart_name,
        label = paste0(domain_alt, " Assessment"),
        type = "plot",
        domain = c('dfSUBJ', domain),
        workflow = list(
            main = chart_function
        ),
        meta = meta
    )

    safetyGraphics::prepareChart(assessment_sg)
}
