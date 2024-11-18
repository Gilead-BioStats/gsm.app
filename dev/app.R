if (basename(getwd()) != 'dev') {
    setwd('dev')
}

library(shiny)
library(DT)
source('mod_AETimelines_UI.R')
source('mod_AETimelines_Server.R')
source('AETimelines_Fetch.R')

lModuleConfig <- yaml::read_yaml(
    'AETimelines.yaml'
)

load_all()
# wire up AEsimrep as gsm.app plugin
# modules must be Shiny modules

lModules <- list(
    list(
        lConfig = lModuleConfig,
        fnUI = mod_AETimelines_UI,
        fnServer = mod_AETimelines_Server,
        fnFetch = AETimelines_Fetch
    )
)

run_gsm_app(
    dfAnalyticsInput = gsm.app::sample_dfAnalyticsInput,
    dfBounds = gsm.app::sample_dfBounds,
    dfGroups = gsm.app::sample_dfGroups,
    dfMetrics = gsm.app::sample_dfMetrics,
    dfResults = gsm.app::sample_dfResults,
    fnFetchParticipantData = sample_FetchParticipantData,
    lModules = lModules
)
