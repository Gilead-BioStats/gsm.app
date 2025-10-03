source(here::here("requirements", "functions", "PrepBRIndex.R"), local = TRUE)
source(
  here::here("requirements", "functions", "SharedFunctions.R"),
  local = TRUE
)

GenerateBRIndex(here::here())

rm(
  `%>%`,
  EnsureRequirementArticleDirs,
  ExtractBRStatuses,
  GenerateBRIndex,
  GenerateBRIndexQMD,
  PackageArticlesPath,
  ReadRequirementIssues,
  RequirementArticleExtrasPath,
  RequirementIssuesPath,
  WriteBRIndexQmd
)
