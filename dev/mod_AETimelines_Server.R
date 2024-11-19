# servers should have an argument for each gsm.app input
# servers can return named list of reactives:
# - site
# - participant
mod_AETimelines_Server <- function(
  id,
  lPluginConfig,
  rctv_InputSite
) {
    moduleServer(id, function(input, output, session) {
        output[[ lPluginConfig$meta$ID ]] <- renderWidget_AETimelines({
            data <- AETimelines_Fetch(lPluginConfig, rctv_InputSite())
            Widget_AETimelines(data)
        })
    })
}
