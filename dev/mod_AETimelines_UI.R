mod_AETimelines_UI <- function(id, lModuleConfig) {
    ns <- NS(id)
    tagList(
        fluidRow(
            column(12,
                h2(lModuleConfig$meta$Name),
                #dataTableOutput(ns(lModuleConfig$meta$ID))
                Widget_AETimelinesOutput(ns(lModuleConfig$meta$ID))
            )
        )
    )
}
