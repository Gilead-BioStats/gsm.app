#' Update sample data for app development.
#'
#' @examples
#' \dontrun{
#' update_sample_data()
#' }
#'
#' @keywords internal
update_sample_data <- function() {
    cli::cli_alert('Your current `gsm` version is {packageVersion(\'gsm\')} - data will be updated using this version.')
    cli::cli_alert_info('If you want to update the data based on a different version, install the specific version and restart your R session.')
    usethis::ui_yeah('Running `update_sample_data()` will overwrite data in `inst/sampledata`. Continue?')

    # list of sample data for the demo application
    data <- list(
        dfSUBJ = clindata::rawplus_dm,
        dfAE = clindata::rawplus_ae,
        dfPD = clindata::ctms_protdev,
        dfSTUDCOMP = clindata::rawplus_studcomp,
        dfSDRGCOMP = clindata::rawplus_sdrgcomp,
        dfQUERY = clindata::edc_queries,
        dfENROLL = clindata::rawplus_enroll
    )

    # subset to a smaller number of workflows
    workflows <- gsm::MakeWorkflowList(
        paste0('kri', sprintf('%04d', c(1:4, 6:7, 9, 12)))
    )

    # include two snapshots so that longitudinal chart(s) are created
    snap_one <- gsm::Make_Snapshot(strAnalysisDate = '2022-01-01', lAssessments = workflows)
    snap_two <- gsm::Make_Snapshot(strAnalysisDate = '2022-02-01', lPrevSnapshot = snap_one, lAssessments = workflows)


    # save snap_two
    qs::qsave(snap_two, here::here('inst', 'sampledata', 'snapshot.qs'))
}


#' pkgload as a dependency
#'
#' @description
#' This is only a placeholder function that has no actual use outside of existing to remove the `devtools::check()` flag that a dependency is not used.
#' We need this as a dependency to host the app on shinyapps.io - this function tricks R into thinking it's a dependency that is being used.
#'
#' @keywords internal
pkgloadHack <- function() {
    pkgload::load_all('.')
}
