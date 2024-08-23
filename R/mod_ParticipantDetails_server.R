mod_ParticipantDetails_Server <- function(
    id,
    fnFetchParticipantData,
    rctv_strSubjectID
) {
  shiny::moduleServer(id, function(input, output, session) {
    rctv_lParticipantData <- shiny::reactive({
      if (
        !length(rctv_strSubjectID()) ||
        rctv_strSubjectID() == "None" ||
        rctv_strSubjectID() == ""
      ) {
        return(NULL)
      }
      fnFetchParticipantData(rctv_strSubjectID())
    })
    rctv_lParticipantMetadata <- shiny::reactive({
      if (length(rctv_lParticipantData())) {
        rctv_lParticipantData()$metadata
      }
    })
    output$metadata <- shiny::renderUI({
      div_ParticipantMetadata(rctv_lParticipantMetadata())
    })

    output$core <- shiny::renderUI({})
  })
}
