mod_ChartTitleSelect_Study_Categorical_UI <- function(id) {
  ns <- NS(id)
  mod_ChartTitleSelect_UI(ns("title"))
}

mod_ChartTitleSelect_Study_Categorical_Server <- function(
    id,
    rctv_dfDomain_Study,
    rctv_strGroupLevel,
    rctv_strGroupID,
    rctv_strSubjectID
) {
  moduleServer(id, function(input, output, session) {
    rctv_chrCategoricalFields <- reactive({
      chrCategoricalFields <- FindCategoricalFieldNames(rctv_dfDomain_Study())
      rlang::set_names(
        chrCategoricalFields,
        MakeParamLabelsChr(chrCategoricalFields, chrFieldNames)
      )
    })
    rctv_strGroupLabel <- reactive({
      req(rctv_strGroupLevel())
      req(rctv_strGroupID())
      strGroupID <- NullifyEmpty(rctv_strGroupID())
      if (length(strGroupID)) {
        glue::glue("{rctv_strGroupLevel()} {strGroupID}")
      }
    })
    rctv_strParticipantLabel <- reactive({
      strSubjectID <- NullifyEmpty(rctv_strSubjectID())
      glue::glue("Participant {strSubjectID}")
    })
    rctv_strCategory <- mod_ChartTitleSelect_Server(
      "title",
      l_rctvLabels = list(
        "#1b9e77" = "Study",
        "#d95f02" = rctv_strGroupLabel,
        "#7570b3" = rctv_strParticipantLabel
      ),
      rctv_chrChoices = rctv_chrCategoricalFields
    )
    return(rctv_strCategory)
  })
}
