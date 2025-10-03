source(here::here("requirements", "functions", "GetBRIssues.R"), local = TRUE)
source(
  here::here("requirements", "functions", "SharedFunctions.R"),
  local = TRUE
)

GeneratePackageRequirements(here::here())

# Clean up everything. Eventually all of this will be in the package namespace,
# so no cleanup.
rm(
  `%>%`,
  EnsureRequirementArticleDirs,
  ExtractAcceptanceCriteria,
  ExtractFeature,
  FinalizeBRIssues,
  GeneratePackageRequirements,
  GenerateProjectQuery,
  GetBRIssues,
  GetFeatureIssues,
  GetPackageRequirements,
  GetProjectFieldID,
  PackageArticlesPath,
  ReadRequirementIssues,
  RequirementArticleExtrasPath,
  RequirementIssuesPath,
  TranslateProjectFieldForQuery,
  WritePackageRequirements
)
