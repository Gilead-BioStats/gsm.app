mod_AETimelines_UI <- function(id, lPluginConfig) {
    ns <- NS(id)
    tagList(
        fluidRow(
            column(12,
                h2(lPluginConfig$meta$Name),
                Widget_AETimelinesOutput(ns(lPluginConfig$meta$ID))
            )
        )
    )
}
