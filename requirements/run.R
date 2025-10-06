# This is essentially equivalent to `pkgload::load_all()` for the requirements
# mini-package.
purrr::walk(
  fs::dir_ls(here::here("requirements", "R")),
  function(RScript) {
    source(RScript)
  }
)

# Fetch and format the list of issues from the GitHub repo, using
# `./_requirements.yml` for configuration by default, then save for use by later
# pieces & by the QMDs themselves.
GenerateRequirementIssuesYaml()

# Generate/update BR articles.
GenerateBRIssueQmds()

# Generate/update BR index page.
GenerateBRIndex()

# Copy images from tests.
SyncBRSnapshots()

# Clean up. Normally all of this would be in the {qcthat} package environment,
# so I want to make sure we empty things out of the global environment.
