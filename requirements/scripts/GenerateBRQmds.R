source(here::here("requirements", "functions", "PrepBRQmds.R"), local = TRUE)
source(
  here::here("requirements", "functions", "SharedFunctions.R"),
  local = TRUE
)

GenerateAllBRIssueQmds(here::here())

# Clean up everything. Eventually all of this will be in the package namespace,
# so no cleanup.
rm(
  `%>%`,
  EnsureRequirementArticleDirs,
  GenerateAllBRIssueQmds,
  GenerateIssueQmd,
  PackageArticlesPath,
  ReadRequirementIssues,
  RequirementArticleExtrasPath,
  RequirementIssuesPath
)
