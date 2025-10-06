# Overall vocab:
# - "Fetch" = "Get from the internet (GitHub)"
# - "Get" = "Fetch and clean"
# - "Finalize" = "Clean, which might involve more fetching"
# - "Extract" = "Pull out of a larger structure"
# - "Read" = "Read from disk"

GenerateRequirementIssuesYaml <- function(
  strPkgPath = here::here(),
  lBRConfig = ReadRequirementsConfig(strPkgPath),
  lPkgRemote = gh::gh_tree_remote(strPkgPath)
) {
  WritePackageRequirements(
    lBRs = GetPackageRequirements(
      strPkgPath = strPkgPath,
      lBRConfig = lBRConfig,
      lPkgRemote = lPkgRemote
    ),
    strPkgPath = strPkgPath
  )
}

WritePackageRequirements <- function(lBRs, strPkgPath = here::here()) {
  EnsureRequirementArticleDirs(strPkgPath)
  WriteRequirementIssues(lBRs, strPkgPath)
}

GetPackageRequirements <- function(
  strPkgPath = here::here(),
  lBRConfig = ReadRequirementsConfig(strPkgPath),
  lPkgRemote = gh::gh_tree_remote(strPkgPath)
) {
  GetGHPackageRequirements(
    chrStatuses = lBRConfig$issues$statuses,
    intProjectNumber = lBRConfig$project$number,
    strBRIssueType = lBRConfig$issues$type,
    strOwner = lPkgRemote$username,
    strRepo = lPkgRemote$repo,
    strStatusFieldName = lBRConfig$project$status_field_name
  )
}

GetGHPackageRequirements <- function(
  chrStatuses,
  intProjectNumber,
  strBRIssueType,
  strOwner,
  strRepo,
  strStatusFieldName
) {
  FinalizeBRIssues(
    lBRIssuesRaw = FetchGHBRIssues(
      chrStatuses,
      intProjectNumber,
      strBRIssueType,
      strOwner,
      strRepo,
      strStatusFieldName
    ),
    strOwner = strOwner,
    strRepo = strRepo
  )
}

FetchGHBRIssues <- function(
  chrStatuses,
  intProjectNumber,
  strBRIssueType,
  strOwner,
  strRepo,
  strStatusFieldName
) {
  gh::gh(
    "GET /orgs/{owner}/projectsV2/{project_number}/items",
    owner = strOwner,
    project_number = intProjectNumber,
    q = CompileProjectQuery(
      chrStatuses,
      strBRIssueType,
      strOwner,
      strRepo,
      strStatusFieldName
    ),
    `fields[]` = GetProjectFieldID(
      strStatusFieldName,
      strOwner,
      intProjectNumber
    )
  )
}

CompileProjectQuery <- function(
  chrStatuses,
  strBRIssueType,
  strOwner,
  strRepo,
  strStatusFieldName
) {
  strStatusFieldQuery <- TranslateProjectFieldForQuery(strStatusFieldName)
  strStatuses <- paste(glue::glue('"{chrStatuses}"'), collapse = ",")
  glue::glue(
    "type:{strBRIssueType}",
    "repo:{strOwner}/{strRepo}",
    "{strStatusFieldQuery}:{strStatuses}",
    .sep = " "
  )
}

TranslateProjectFieldForQuery <- function(strFieldName) {
  stringr::str_replace_all(tolower(strFieldName), "\\s", "-")
}

GetProjectFieldID <- function(strFieldName, strOwner, intProjectNumber) {
  lProjectFields <- gh::gh(
    "GET /orgs/{org}/projectsV2/{project_number}/fields",
    org = strOwner,
    project_number = intProjectNumber
  )
  lTargetField <- purrr::keep(lProjectFields, ~ .x$name == strFieldName)[[1]]
  return(lTargetField$id)
}

FinalizeBRIssues <- function(lBRIssuesRaw, strOwner, strRepo) {
  lBRIssues <- purrr::map(lBRIssuesRaw, function(lIssue) {
    list(
      issue = lIssue$content$number,
      title = lIssue$content$title,
      description = lIssue$content$body,
      status = lIssue$fields[[1]]$value$name$raw,
      features = GetFeatureIssues(
        lIssue$content$number,
        strOwner,
        strRepo
      )
    )
  })
  # Sort by issue number.
  lBRIssues[order(purrr::map_int(lBRIssues, "issue"))]
}

GetFeatureIssues <- function(intIssueNumber, strOwner, strRepo) {
  lGHFeatures <- gh::gh(
    "GET /repos/{owner}/{repo}/issues/{issue_number}/sub_issues",
    owner = strOwner,
    repo = strRepo,
    issue_number = intIssueNumber
  )
  purrr::map(lGHFeatures, ExtractFeature)
}

ExtractFeature <- function(lGHIssue_feature) {
  list(
    issue = lGHIssue_feature$number,
    title = lGHIssue_feature$title,
    acceptance_criteria = ExtractAcceptanceCriteria(lGHIssue_feature$body),
    labels = purrr::map_chr(lGHIssue_feature$labels, "name")
  )
}

ExtractAcceptanceCriteria <- function(strFeatureBody) {
  CleanAcceptanceCriteria(ExtractNonemptyFeatureBody(strFeatureBody))
}

ExtractNonemptyFeatureBody <- function(strFeatureBody) {
  if (length(strFeatureBody)) {
    stringr::str_subset(
      stringr::str_trim(stringr::str_split_1(strFeatureBody, "\\n")),
      "." # Require at least one character.
    )
  } else {
    character()
  }
}

CleanAcceptanceCriteria <- function(chrBody) {
  strChecklistMDRegex <- "^\\s*-\\s*\\[(\\s*|x)\\]\\s*"
  intTargetRows <- LocateAcceptanceRows(chrBody, strChecklistMDRegex)
  stringr::str_remove(chrBody[intTargetRows], strChecklistMDRegex)
}

LocateAcceptanceRows <- function(chrBody, strChecklistMDRegex) {
  intACHeaderRow <- stringr::str_which(chrBody, "^#+\\s+Acceptance Criteri")
  # We only want lines after the Acceptance Criteria header, and those lines
  # need to be a checklist member.
  intBodyRows <- seq_along(chrBody)
  intTargetRows <- intBodyRows[intBodyRows > intACHeaderRow]
  intHeaderRows <- stringr::str_which(chrBody, "^#+\\s+")
  intNextHeaderRows <- intHeaderRows[intHeaderRows > intACHeaderRow]
  if (length(intNextHeaderRows)) {
    intTargetRows <- intTargetRows[intTargetRows < intNextHeaderRows[[1]]]
  }
  return(intTargetRows)
}
