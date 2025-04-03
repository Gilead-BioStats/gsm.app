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
  SUBJ,
  AE,
  ENROLL
) {
  moduleServer(id, function(input, output, session) {
    mod_ParticipantMetadata_Server("metadata", SUBJ)
    mod_ParticipantDomainSummary_Server(
      "domains",
      rctv_strDomainID,
      list(
        AE = AE,
        ENROLL = ENROLL
      )
    )
  })
}
