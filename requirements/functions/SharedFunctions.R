`%>%` <- magrittr::`%>%`

ReadRequirementIssues <- function(path = ".") {
  yaml::read_yaml(RequirementIssuesPath(path))
}

RequirementIssuesPath <- function(path = ".") {
  RequirementArticleExtrasPath(path, "requirement_issues.yml")
}

RequirementArticleExtrasPath <- function(path = ".", ...) {
  PackageArticlesPath(path, "requirements", ...)
}

PackageArticlesPath <- function(path = ".", ...) {
  fs::path(path, "vignettes", "articles", ...)
}

EnsureRequirementArticleDirs <- function(path) {
  fs::dir_create(RequirementArticleExtrasPath(path))
}
