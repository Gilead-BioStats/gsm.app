ReadRequirementIssues <- function(strPkgPath = here::here()) {
  yaml::read_yaml(RequirementIssuesPath(strPkgPath))
}

WriteRequirementIssues <- function(lBRs, strPkgPath = here::here()) {
  yaml::write_yaml(lBRs, RequirementIssuesPath(strPkgPath))
}

RequirementIssuesPath <- function(strPkgPath = here::here()) {
  RequirementArticleExtrasPath(strPkgPath, "requirement_issues.yml")
}

RequirementArticleExtrasPath <- function(strPkgPath = here::here(), ...) {
  PackageArticlesPath(strPkgPath, "requirements", ...)
}

PackageArticlesPath <- function(strPkgPath = here::here(), ...) {
  fs::path(strPkgPath, "vignettes", "articles", ...)
}

EnsureRequirementArticleDirs <- function(strPkgPath) {
  fs::dir_create(RequirementArticleExtrasPath(strPkgPath))
}

ReadTemplate <- function(strTemplateName, strPkgPath = here::here()) {
  readr::read_file(
    fs::path(
      strPkgPath,
      "requirements",
      "templates",
      strTemplateName
    )
  )
}

ReadRequirementsConfig <- function(strPkgPath = here::here()) {
  yaml::read_yaml(fs::path(strPkgPath, "_requirements.yml"))
}

CompileVariantDir <- function() {
  paste("br", shinytest2::platform_variant(), sep = "-")
}
