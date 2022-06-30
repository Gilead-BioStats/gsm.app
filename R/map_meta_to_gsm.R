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
#' meta_gsm <- map_meta_to_gsm()
#'
#' @export

map_meta_to_gsm <- function(meta_in) {
    meta_out <- meta_in %>%
        imap(function(domain, domain_key) {
            metadata <- domain %>%
                imap(function(metadatum, key) {
                    unlist(metadatum)
                })

            if (domain_key == 'dfAE') {
                metadata = metadata %>%
                    list_modify(
                        strSeriousVal = metadata[[ 'strSeriousValues' ]],
                        strTreatmentEmergentVal = metadata[[ 'strTreatmentEmergentValues' ]]
                    )
            }

            if (domain_key == 'dfCONSENT') {
                metadata = metadata %>%
                    list_modify(
                        strConsentTypeValue = metadata[[ 'strTypeValues' ]],
                        strConsentStatusValue = metadata[[ 'strValueValues' ]]
                    )
            }

            if (domain_key == 'dfIE') {
                metadata = metadata %>%
                    list_modify(
                        vCategoryValues = metadata[[ 'strCategoryValues' ]],
                        vExpectedResultValues = metadata[[ 'strValueValues' ]]
                    )
            }

            if (domain_key == 'dfPD') {
                metadata = metadata %>%
                    list_modify(
                        strImportantVal = metadata[[ 'strImportantValues' ]]
                    )
            }

            metadata
        })

    meta_out
}
