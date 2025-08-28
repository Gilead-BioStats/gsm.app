#' Interactive plots of prevalence of categorical variables
#'
#' @inheritParams shared-params
#' @returns A [bslib::card()] with an interactive prevalence plot.
#' @keywords internal
mod_PrevalencePlotCard_UI <- function(id, strPlotTitle = NULL) {
  ns <- NS(id)
  out_Card(
    id = ns("card"),
    tagTitle = strPlotTitle,
    div(
      id = ns("title"),
      mod_SelectDataCategory_UI(ns("category")),
      mod_DynamicLabelKey_UI(ns("key"))
    ),
    mod_PrevalencePlot_UI(ns("plot"))
  )
}

#' Server side of prevalence plot module
#'
#' @inheritParams shared-params
#' @keywords internal
mod_PrevalencePlotCard_Server <- function(
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

    mod_PrevalencePlot_Server(
      "plot",
      rctv_dfDomain_Combined,
      rctv_strCategory
    )
  })
}
