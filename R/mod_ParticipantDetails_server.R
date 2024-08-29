#' Participant Details server
#'
#' Update Participant Details when the selected participant changes.
#'
#' @inheritParams shared-params
#'
#' @keywords internal
mod_ParticipantDetails_Server <- function(
    id,
    fnFetchParticipantData,
    rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_lParticipantData <- reactive({
      if (
        !length(rctv_strSubjectID()) ||
        rctv_strSubjectID() == "None" ||
        rctv_strSubjectID() == ""
      ) {
        return(NULL)
      }
      fnFetchParticipantData(rctv_strSubjectID())
    })
    rctv_lParticipantMetadata <- reactive({
      if (length(rctv_lParticipantData())) {
        rctv_lParticipantData()$metadata
      }
    })
    rctv_lParticipantMetricData <- reactive({
      if (length(rctv_lParticipantData())) {
        rctv_lParticipantData()$metric_data
      }
    })
    output$metadata <- renderUI({
      div_ParticipantMetadata(rctv_lParticipantMetadata())
    })

    output$metric_summary <- renderUI({
      div_ParticipantMetricSummary(
        session$ns(""),
        rctv_lParticipantMetricData())
    })


    rv_MetricSelect <- reactiveVal(NULL)

    observeEvent(input$adverseEvents, {
      rv_MetricSelect("adverseEvents")
    })
    observeEvent(input$protocolDeviations, {
      rv_MetricSelect("protocolDeviations")
    })
    observeEvent(input$studyDisposition, {
      rv_MetricSelect("studyDisposition")
    })
    observeEvent(input$treatmentDisposition, {
      rv_MetricSelect("treatmentDisposition")
    })

    output$domain_data_table <- renderTable({
      rctv_lParticipantMetricData()[[rv_MetricSelect()]]
    })


  })
}

#' The placeholder portion of a participant card
#'
#' @return An [htmltools::div()] asking the user to select a participant.
#' @keywords internal
div_ParticipantCard_Placeholder <- function(strMessage = "Please select a participant.") {
  div(
    class = "card placeholder",
    div(
      class = "card-body",
      div(
        class = "card-text",
        strMessage
      )
    )
  )
}

#' Participant card
#'
#' @inheritParams shared-params
#' @param divParticipantCore The core participant content, such as a placeholder
#'   or a collection of rows.
#'
#' @return An [htmltools::div()] of participant data.
#' @keywords internal
div_ParticipantCard_Wrapper <- function(strCardTitle, divParticipantCore) {
  div(
    class = "col-12 col-sm-8 col-md-6 col-lg-5 col-xl-3 col-xxl-3",
    div(
      class = "card mb-3 mx-2",
      div(
        class = "card-body",
        h5(class = "card-title", strCardTitle),
        hr(),
        divParticipantCore
      )
    )
  )
}
