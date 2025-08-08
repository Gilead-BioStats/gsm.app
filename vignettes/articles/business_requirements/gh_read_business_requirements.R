# Functions to read issue definitions from GitHub. Run via `gen_br_yaml.R`

gh_read_business_requirements <- function(intIssues) {
  intIssues <- as.integer(intIssues)
  purrr::map(intIssues, gh_read_br)
}

gh_read_br <- function(intIssue) {
  lGHIssue_BR <- gh::gh(
    "GET /repos/Gilead-BioStats/gsm.app/issues/{issue_number}",
    issue_number = intIssue
  )
  lFeatures <- gh_read_feature_issues(intIssue)

  # Assemble final list
  list(
    issue = intIssue,
    title = lGHIssue_BR$title,
    description = lGHIssue_BR$body,
    features = lFeatures
  )
}

gh_read_feature_issues <- function(intIssue) {
  lGHFeatures <- gh::gh(
    "GET /repos/Gilead-BioStats/gsm.app/issues/{issue_number}/sub_issues",
    issue_number = intIssue
  )
  purrr::map(lGHFeatures, extract_feature)
}

extract_feature <- function(lGHIssue_feature) {
  list(
    issue = lGHIssue_feature$number,
    title = lGHIssue_feature$title,
    acceptance_criteria = extract_acceptance_criteria(lGHIssue_feature$body)
  )
}

extract_acceptance_criteria <- function(strFeatureBody) {
  chrBody <- stringr::str_split_1(strFeatureBody, "\\n") %>%
    stringr::str_trim() %>%
    stringr::str_subset(".")
  intACHeaderRow <- stringr::str_which(chrBody, "^#+\\s+Acceptance Criteri")
  if (isTRUE(as.logical(intACHeaderRow))) {
    strChecklistMDRegex <- "^\\s*-\\s*\\[[^\\]]*\\]\\s*"
    # We only want lines after the Acceptance Criteria header, and those lines
    # need to be a checklist member.
    chrBody[seq_along(chrBody) > intACHeaderRow] %>%
      stringr::str_subset(strChecklistMDRegex) %>%
      stringr::str_remove(strChecklistMDRegex)
  } else {
    character()
  }
}
