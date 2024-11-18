# servers should have an argument for each gsm.app input
# servers can return named list of reactives:
# - site
# - participant
mod_AETimelines_Server <- function(
  id,
  lModuleConfig,
  rctv_InputSite
) {
    moduleServer(id, function(input, output, session) {
        #output[[ lModuleConfig$meta$ID ]] <- renderDataTable({
        #    data
        #})
        output[[ lModuleConfig$meta$ID ]] <- renderWidget_AETimelines({
            data <- AETimelines_Fetch(lModuleConfig, rctv_InputSite())
            Widget_AETimelines(data)
        })
    })
}
