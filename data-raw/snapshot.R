devtools::install_github("Gilead-BioStats/gsm@fix-1495")

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
snapshot <- Make_Snapshot(strAnalysisDate = "2022-03-01", lPrevSnapshot = snap_two, lAssessments = workflows)

gsm::Save_Snapshot(snapshot, 'data-raw')

usethis::use_data(snapshot, overwrite = TRUE)
