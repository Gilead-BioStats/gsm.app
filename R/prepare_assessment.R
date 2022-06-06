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
prepare_assessment <- function(
    meta,
    assessment = list(
        domain_name = NULL,
        map_function = NULL,
        assess_function = NULL
    )
) {
    domain_lower <- assessment$domain_name # as expected by {safetyGraphics}
    domain_upper <- toupper(domain_lower)
    domain_alt <- domain_upper
    if (domain_alt == 'CONSENT')
        domain_alt = 'Consent'
    domain_gsm <- paste0('df', domain_upper) # as expected by {gsm}

    chart_function <- paste0('run_', domain_lower, '_assessment')
    chart_name <- paste0(domain_lower, '_assessment')

    run_assessment <- function(data, settings) {
        # Define list of data frames.
        dfs <- list(
            dfSUBJ = data$subj
        )
        dfs[[ domain_gsm ]] <- data[[ domain_lower ]]

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
        domain = c(domain_lower, "subj"),
        workflow = list(
            main = chart_function
        ),
        meta = meta
    )

    safetyGraphics::prepareChart(assessment_sg)
}
