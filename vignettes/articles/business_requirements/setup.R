# Add issue numbers to track here. Sourcing this file pulls business requirement
# data from GitHub to generate reports for these issues. Right now this needs to
# be manually executed once by a dev whenever this issue list (or the associated
# tests) changes.
intBRs <- c(
  518,
  519
)

# Generate/update business_requirements.yml
source(
  here::here(
    "vignettes",
    "articles",
    "business_requirements",
    "gh_read_business_requirements.R"
  ),
  local = TRUE
)
lBRs <- gh_read_business_requirements(intBRs)
yaml::write_yaml(
  lBRs,
  here::here(
    "vignettes",
    "articles",
    "business_requirements",
    "business_requirements.yml"
  )
)

# TODO: Generate/update {issue_number}.qmd.

rm(intBRs, lBRs)
