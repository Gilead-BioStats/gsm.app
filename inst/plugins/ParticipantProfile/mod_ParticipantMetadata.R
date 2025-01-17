mod_ParticipantMetadata_UI <- function(id) {
  ns <- NS(id)
  out_Card(
    "Participant Metadata",
    uiOutput(ns("metadata")),
    id = ns("card")
  )
}

mod_ParticipantMetadata_Server <- function(id, rctv_dfSUBJ) {
  moduleServer(id, function(input, output, session) {
    # Ideally this should be defined in gsm.mapping.
    chrFieldNames <- c(
      aeen_dt = "End Date",
      aeser = "Serious",
      aest_dt = "Start Date",
      aetoxgr = "Toxicity Grade",
      agerep = "Age",
      companycategory = "Company Category",
      compreas = "Discontinuation Reason",
      compyn = "Completed Study",
      deemedimportant = "Deemed Important",
      deviationdate = "Deviation Date",
      enroll_dt = "Enrollment Date",
      enrollyn = "Enrolled",
      ethnic = "Ethnicity",
      fieldoid = "Field",
      firstdosedate = "Treatment Start Date",
      firstparticipantdate = "Study Start Date",
      formoid = "Form",
      lb_dt = "Visit Date",
      lbtstnam = "Lab Test",
      mdrpt_nsv = "Preferred Term",
      mdrsoc_nsv = "System Organ Class",
      queryage = "Query Age",
      querystatus = "Query Status",
      sdrgreas = "Discontinuation Reason",
      sdrgyn = "Completed Treatment",
      sfreas = "Screen Failure Reason",
      siresn = "Result",
      subject_nsv = "Intake ID",
      subjectid = "Intake ID",
      subjid = "Subject ID",
      timeonstudy = "Days on Study",
      timeontreatment = "Days on Treatment",
      toxgrg_nsv = "Toxicity Grade",
      visnam = "Visit"
    )
    output$metadata <- renderUI({
      req(rctv_dfSUBJ())
      lParticipantMetadata <- as.list(rctv_dfSUBJ())
      out_MetadataList(
        gsm::MakeParamLabelsList(names(lParticipantMetadata), chrFieldNames),
        unname(lParticipantMetadata)
      )
    })
  })
}
