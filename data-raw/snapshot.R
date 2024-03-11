devtools::install_github("Gilead-BioStats/gsm@dev")


library(magrittr)
library(gsm)

data <- list(
    dfSUBJ = clindata::rawplus_dm,
    dfAE = clindata::rawplus_ae,
    dfPD = clindata::ctms_protdev,
    dfSTUDCOMP = clindata::rawplus_studcomp,
    dfSDRGCOMP = clindata::rawplus_sdrgcomp,
    dfQUERY = clindata::edc_queries,
    dfENROLL = clindata::rawplus_enroll
)

workflows <- gsm::MakeWorkflowList(
    paste0('kri', sprintf('%04d', c(1:4, 6:7, 9, 12)))
)

snap_one <- Make_Snapshot(strAnalysisDate = "2022-01-01", lAssessments = workflows)
snap_two <- Make_Snapshot(strAnalysisDate = "2022-02-01", lPrevSnapshot = snap_one, lAssessments = workflows)


assessment_with_date <- list(
    lSnapshotDate = snap_two$lSnapshotDate,
    lSnapshot = snap_two$lSnapshot
    )

saveRDS(assessment_with_date, here::here("data", "snapshot_lSnapshot.rda"))

purrr::iwalk(snap_two, function(data, nm) {

    if (!nm %in% c("lSnapshotDate", "lSnapshot")) {
        saveRDS(data, file = here::here("data", paste0("snapshot_", nm, ".rda")))
    }

})


