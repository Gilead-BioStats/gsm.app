source(
  here::here("requirements", "functions", "SharedFunctions.R"),
  local = TRUE
)
source(
  here::here("requirements", "functions", "SyncBRSnapshots.R"),
  local = TRUE
)
SyncBRSnapshots(here::here())
rm(
  SyncBRSnapshots
)
