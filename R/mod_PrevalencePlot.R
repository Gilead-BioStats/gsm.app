mod_PrevalencePlot_UI <- function(id, strTitle = NULL) {
  ns <- NS(id)
  out_Card(
    id = ns("card"),
    tagTitle = strTitle,
    div(
      id = ns("title"),
      mod_SelectDataCategory_UI(ns("category")),
      mod_DynamicLabelKey_UI(ns("key"))
    ),
    mod_PrevalencePlotPlot_UI(ns("plot"))
  )
}

mod_PrevalencePlot_Server <- function(
  id,
  rctv_dfDomain,
  rctv_dfDomain_Group,
  rctv_dfDomain_Study,
  rctv_strGroupLevel,
  rctv_strGroupID,
  rctv_strSubjectID,
  l_rctvDomainLoaded
) {
  moduleServer(id, function(input, output, session) {
    # The key (what's turned on/off) needs to be sorted out before we can know
    # what else is happening, so put that at the top.
    l_rctvActive <- mod_DynamicLabelKey_Server(
      "key",
      rctv_strGroupLevel = rctv_strGroupLevel,
      rctv_strGroupID = rctv_strGroupID,
      rctv_strSubjectID = rctv_strSubjectID
    )

    rctv_dfDomain_Combined <- mod_CombineDomainData_Server(
      "DomainCombiner",
      l_rctvActive,
      rctv_dfDomain_Study,
      rctv_dfDomain_Group,
      rctv_dfDomain,
      rctv_strGroupLevel,
      rctv_strGroupID,
      rctv_strSubjectID
    )

    rctv_strCategory <- mod_SelectDataCategory_Server(
      "category",
      rctv_dfDomain_Combined
    )

    mod_PrevalencePlotPlot_Server(
      "plot",
      rctv_dfDomain_Combined,
      rctv_strCategory,
      rctv_strGroupLevel
    )
  })
}
