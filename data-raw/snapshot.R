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

snapshot <- gsm::Make_Snapshot(
    lData = data,
    lAssessments = workflows
) %T>%
    gsm::Save_Snapshot('data-raw')

usethis::use_data(snapshot)
