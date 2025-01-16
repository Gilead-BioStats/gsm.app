mod_ParticipantProfile_UI <- function(id) {
  ns <- NS(id)
  bslib::layout_columns(
    col_widths = c(6, 6),
    mod_ParticipantMetadata_UI(ns("metadata")),
    mod_ParticipantDomainSummary_UI(ns("domains"))
  )
}

mod_ParticipantProfile_Server <- function(
  id,
  rctv_strDomainID,
  rctv_dfAE,
  rctv_dfDATACHG,
  rctv_dfDATAENT,
  rctv_dfENROLL,
  rctv_dfLB,
  rctv_dfPD,
  rctv_dfQUERY,
  rctv_dfSTUDCOMP,
  rctv_dfSUBJ,
  rctv_dfSDRGCOMP
) {
  moduleServer(id, function(input, output, session) {
    mod_ParticipantMetadata_Server("metadata", rctv_dfSUBJ)
    mod_ParticipantDomainSummary_Server(
      "domains",
      rctv_strDomainID,
      list(
        AE = rctv_dfAE,
        DATACHG = rctv_dfDATACHG,
        DATAENT = rctv_dfDATAENT,
        ENROLL = rctv_dfENROLL,
        LB = rctv_dfLB,
        PD = rctv_dfPD,
        QUERY = rctv_dfQUERY,
        STUDCOMP = rctv_dfSTUDCOMP,
        SDRGCOMP = rctv_dfSDRGCOMP
      )
    )
  })
}
