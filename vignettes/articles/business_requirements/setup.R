# Add issue numbers to track here. Sourcing this file pulls business requirement
# data from GitHub to generate reports for these issues. Right now this needs to
# be manually executed once by a dev whenever this issue list (or the associated
# tests) changes.
lBRStatuses <- list(
  "Validated" = c(518, 519)
)
intBRs <- sort(unname(unlist(lBRStatuses)))

# Generate/update business_requirements.yml
pkgload::load_all()
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

# Generate/update BR articles.
source(
  here::here(
    "vignettes",
    "articles",
    "business_requirements",
    "generate_br_pages.R"
  ),
  local = TRUE
)

# Generate/update BR index page.
source(
  here::here(
    "vignettes",
    "articles",
    "business_requirements",
    "generate_br_index.R"
  ),
  local = TRUE
)

rm(intBRs, lBRs, lBRStatuses)
