# Contributing to gsm.app

This outlines how to propose a change to gsm.app.

## Fixing typos

You can fix typos, spelling mistakes, or grammatical errors in the documentation directly using the GitHub web interface, as long as the changes are made in the _source_ file. 
This generally means you'll need to edit [roxygen2 comments](https://roxygen2.r-lib.org/articles/roxygen2.html) in an `.R`, not a `.Rd` file. 
You can find the `.R` file that generates the `.Rd` by reading the comment in the first line.

## Bigger changes

### Prerequisites

Before contributing code via a Pull Request, make sure to file an [issue](https://github.com/Gilead-BioStats/gsm.app/issues/new/choose) using one of the pre-specified issue templates. Choose the template that best categorizes what you aim to contribute, which generally can be one of the following:

-   Bugfix Issue: Fix a bug in the code
-   Feature Issue: Develop a new feature
-   QC Issue: Update QC framework, including documentation, qualification, automation, etc.
-   UI Issue: Change the appearance of the apps produced by this package

Someone from the development team will decide if the issue is in scope. If so, the issue will be appropriately triaged and assigned to a core developer, or approval to submit a Pull Request associated with the submitted issue will be granted. If it is decided that the issue is out of scope or otherwise irrelevant, the issue will be closed.

The issue templates provide comments/prompts to help ensure that all relevant information is included. When submitting issues for bug fixes or specific feature requests, it is often helpful to provide a minimal [reprex](https://www.tidyverse.org/help/#reprex), or reproducible example, to help the core developers visualize the issue.

Suggestions or other input that might not warrant formal submission of an issue can be filed under [discussions](https://github.com/Gilead-BioStats/gsm.app/discussions), which can help facilitate discourse of specific use-cases or requests.

### Branches

The core branches that are used in this repository are:

-   `main`: Contains the production version of the package.
-   `dev`: Contains the development version of the package.
-   `fix-XXXX`: Used to develop new functionality in the package. See [Development Process](#development-process) below for more details.
-   `release`: Used to conduct regression testing and finalize QC documentation for a release. See [Release Process](#release-process) below for more details.

### Development Process {#development-process}

All code development takes place in `fix` branches. This section provides general guidance about this process flow. A detailed step-by-step workflow for code development in `fix` branches can be found in the first section of [Appendix 1](#fix-branch-workflow) below.

Once an issue is filed and delegated to a core developer, a `fix` branch will be opened, which is where all package development related to that issue will be conducted. Each `fix` branch should be linked to one or more of the filed GitHub [issue(s)](https://github.com/Gilead-BioStats/gsm.app/issues). The issue(s) will be referenced in the naming of the `fix` branch. For example, a branch named `fix-111` addresses issue #111. Tasks related to documentation, testing, and/or qualification may also use `fix` branches and associated issues.

In addition to the above, please also use the following general guidelines when creating a Pull Request:

-   New code should generally follow the [tidyverse style guide](https://style.tidyverse.org/), but automatic styling will be applied before each release. More details about the style guide can be found [here](#style-guide).
-   Documentation should be included, using the [roxygen2](https://cran.r-project.org/web/packages/roxygen2/vignettes/roxygen2.html) package.
-   New functions or changes to existing functions should include updated unit tests to demonstrate branch compatibility. Core developers request that unit tests are developed using [testthat \>= v3.0.0](https://testthat.r-lib.org/).
-   Please include any relevant details that will provide context for the proposed updates or new functionality. Additionally, link the Pull Request to the relevant issue(s) by using either [closing keywords](https://docs.github.com/en/issues/tracking-your-work-with-issues/linking-a-pull-request-to-an-issue#linking-a-pull-request-to-an-issue-using-a-keyword), or the `Development` section on the sidebar of the Pull Request page.
-   In general, all Pull Requests should target the `dev` branch (with the exception of a release Pull Request).
-   All checks and tests must be passing before merging a Pull Request to `dev`. These checks are automatically run via GitHub Actions, as described in [Appendix 3](#github-action-workflow), but you can also run them locally by calling `devtools::check()` on your `fix` branch before finalizing a Pull Request.

## Release Process {#release-process}

Code release follows a process using `release` branches. A release is initiated when all feature development, QC, and qualification has been completed for a given functionality. The primary objective of the Release Workflow is to conduct regression testing and finalize all QC documentation for that release. A detailed step-by-step workflow for code release can be found in the second section of [Appendix 1](#release-branch-workflow) below.

## Style Guide {#style-guide}

Code developers for `{gsm.app}` use the [tidyverse style guide](https://style.tidyverse.org/) with minimal modifications. The code below is run to standardize styling before each release:

    double_indent_style <- styler::tidyverse_style()
    double_indent_style$indention$unindent_fun_dec <- NULL
    double_indent_style$indention$update_indention_ref_fun_dec <- NULL
    double_indent_style$line_break$remove_line_breaks_in_fun_dec <- NULL
    styler::style_dir('R', transformers = double_indent_style)
    styler::style_dir('tests', recursive = TRUE, transformers = double_indent_style)

### Imports

We recommend reading the [Dependencies: In Practice chapter of R Packages 2e](https://r-pkgs.org/dependencies-in-practice.html) before adding any dependencies to this package. Some specific guidelines:

- Do not add a dependency for something that can be done relatively easily in base R. This is a fine line, so it's acceptable to err on the side of adding the dependency; we can help with the work needed to avoid the dependency.
- If a package is only needed for specific functions that won't be called by many/most users, call `usethis::use_package(pkg, "Suggests")`, and follow the instructions for making your code inform users to install the required package.
- If a package is used by most/all users, call `usethis::use_package(pkg)` to make sure the package is in the `Imports:` section of the `DESCRIPTION`. This will also "elevate" the package from `Suggests:` to `Imports:` if it is already used in that manner.
- Do not use `@import` or `@importFrom` directly in a function's {roxygen2} block.
- If the imported function is an infix (like `%||%`) or is used in a "tight loop" that could conceivably be called millions of times, use `usethis::use_import_from(pkg, function)` to import the function.
- Other functions should be namespaced using `pkg::function()`. This makes it easier to find where the dependency is used, in case we want or need to reduce our dependency footprint.
- In rare cases, we might want to `usethis::use_import_from()` other frequently used functions, or even `@import` an entire package. If you believe this should happen in your code, please explain why in your pull request.

## Appendix 1 - Detailed Workflows

### `fix` Branch Workflow {#fix-branch-workflow}

1.  Create issue(s) defining addition(s) and/or revision(s):
    -   Select the appropriate [template](https://github.com/Gilead-BioStats/gsm.app/issues/new/choose) to use (should be one of the following):
        -   `Bugfix Issue`
        -   `Feature Issue`
        -   `QC Issue`
    -   Assign issue(s) to core developer(s).
    -   Assign milestone within issue(s).
2.  Developer creates `fix` branch (with nomenclature reflecting associated issue(s)) and updates the associated code(s).
3.  Developer opens Pull Request for the `fix` branch to be merged into the `dev` branch using the GitHub default Pull Request template. Developer should do the following:
    -   Assign Pull Request to self.
    -   Requests review(s).
    -   Assign milestone.
    -   Link to associated issue(s).
4.  Before the `fix` branch can be merged into the `dev` branch, the Pull Request must:
    -   Be approved by assigned code reviewer(s).
    -   Pass all GitHub qualification checks.
5.  `fix` branch is merged into the `dev` branch after the above requirements are fulfilled. The user who merges the `fix` branch should make sure to delete it upon merging.

## `release` Branch Workflow {#release-branch-workflow}

1.  Release Owner creates `release` branch from `dev` branch.
    -   The `release` branch should be named according to the version of `{gsm.app}` being released (e.g., `release-v1.2.0`) using [semantic versioning](https://semver.org/).
    -   If a release branch is already created, make sure that it is synced with the current `dev` branch.
2.  Release Owner prepares the release for QC by performing the following steps and pushing updates to the `release` branch:
    -   Confirm that the version in the `DESCRIPTION` file is up to date.

    -   Run `styler` using the script from the [style guide](#style-guide) above and commit any updates.
    -   Update `NEWS.md` with a summary of the revisions/additions in the release. Keep any information from previous releases to maintain traceability through versions.
    -   Ensure that the qualification specifications spreadsheet is up-to-date and accurate. If there have been any changes/updates to qualification tests, reach out to the qualification developer to update any necessary files.
    -   If applicable, review `README.md` and relevant vignettes to make sure updates are accurately described.
    -   Ensure all unit tests are passing.
    -   Check if all qualification tests are passing and if new features were added that need to be qualified. If updates are needed, they should be outlined in a release QC issue.
    -   Run `devtools::spell_check()` and resolve findings.
    -   Build site using `pkgdown::build_site()`. Check that all examples are displayed correctly and that all new functions occur on the Reference page.
    -   Open a clean R session. Run `devtools::install()` and then `devtools::check()` locally and confirm that there are no issues/conflicts.
3.  Release Owner creates Pull Request from the `release` branch to the `main` branch:
    -   Use the [release Pull Request template](https://github.com/Gilead-BioStats/gsm.app/blob/dev/.github/PULL_REQUEST_TEMPLATE/release.md) by adding `?template=release.md` to the URL when creating the Pull Request. The user can also click the link, then click `Raw`, and copy/paste the displayed Markdown into the Pull Request.
    -   Assign Pull Request to self.
    -   Request QC review(s).
    -   Assign milestone.
    -   Complete Risk Assessments for each Assessment/Feature added as outlined in the Pull Request template.
    -   Create comments in the Pull Request with a unique [QC checklist](#appendix-2---qc-checklist) for each selected Assessment/Feature.
4.  QC Reviewer(s) conduct(s) review by:
    -   Completing all QC checklists in the Pull Request.
    -   Ensuring all GitHub Actions on the Pull Request to the `main` branch are passing.
5.  QC Reviewer(s) approve(s) Pull Request or request(s) changes. If changes are needed:
    -   QC Reviewer(s) should file issues and the development team should follow the standard package development process using `fix` branches.
    -   Once issues are resolved and merged to the `dev` branch, Release Owner can merge the `dev` branch into the `release` branch, and re-request review.
    -   If needed, the original Pull Request can be closed and a new release Pull Request can be created with a Release Candidate (RC) value added to the branch name (e.g., `release-v1.2.0-RC2`)
6.  Once the Pull Request is approved, the Release Owner should complete the release by taking the following steps:
    -   Merge the release Pull Request to the `main` branch.
    -   Create the GitHub release targeting the `main` branch using the wording from `NEWS.md`, in addition to the automatically generated content in GitHub.
    -   Confirm that the QC Report is attached to release.
7.  Finally, the Release Owner (or qualified designee) should complete the following housekeeping tasks:
    -   Create a Pull Request to merge the `main` branch into the `dev` branch to sync any updates that were made during release process.
    -   Check that all issues associated with the current release are closed.
    -   Update the milestone for any incomplete tasks.
    -   Delete code branches associated with previous releases.
    -   Close the milestone and project associated with the previous release.

# Appendix 2 - QC Checklist {#appendix-2---qc-checklist}

This QC checklist is to be used as part of the Development and Release Workflows described above. When applied to an Assessment/Feature, confirm that each function meets the requirements described. When applied to utility or other functionality, use relevant sections of the checklist and modify QC checks as needed. A risk-based approach will be used to determine whether each release requires a high-level or detailed release QC.

### High-Level QC Checklist

-   [ ] Documentation
    -   [ ] New functionality contains an `@export` tag if appropriate.
    -   [ ] New functionality contains an adequate level of documentation.
-   [ ] Error Checking
    -   [ ] New functionality has associated unit test(s).
    -   [ ] Tests confirm that the input data has required columns (if any).
    -   [ ] Tests confirm that the output data has expected columns/structure.
    -   [ ] Tests confirm intended functionality for each parameter.
-   [ ] Basic QC
    -   [ ] Code is well commented and easy to read/understand.
    -   [ ] No file paths or other company-specific data are present.
    -   [ ] `devtools::check()` passes with no errors/warnings/notes.
    -   [ ] Package documents are up to date, and running `devtools::document()` does not change any files.
    -   [ ] Code uses `{tidyverse}` best practices for standard data manipulation. If unclear, reviewer should start a discussion thread.
    -   [ ] All new dependencies add significant value. If unclear, reviewer should start a discussion thread.
    -   [ ] All GitHub Actions run with no errors.

### Detailed QC Checklist

-   [ ] Documentation
    -   [ ] Function name captured in [roxygen2 title](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html#the-description-block) (e.g., "Adverse Event Assessment")
    -   [ ] Function purpose captured in [roxygen2 description](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html#the-description-block) (e.g., "Evaluates adverse event (AE) rates to identify sites that may be over- or under-reporting AEs")
    -   [ ] All function parameters are described with a [`@param` tag](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html#functions). Each parameter description should include its name, type, purpose, usage details, default value (if applicable), requirement, and valid options (if applicable).
    -   [ ] All external dependencies are captured. Fully qualify funtions from other packages (such as `dplyr::filter()`), and `usethis::usepackage()` to add the package as a dependency (eg, `usethis::use_package("dplyr")`).
    -   [ ] Function output is captured with a [`@returns` tag](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html#functions). Each output description should include output type, structure, and data specification (if applicable).
    -   [ ] At least one (1) example is provided under an [`@examples` tag](https://cran.r-project.org/web/packages/roxygen2/vignettes/rd.html#functions).
-   [ ] Error Checking
    -   [ ] Basic checks for all parameters should be included using `stopifnot()` or similar logic (e.g., `stopifnot("dfInput is not a data frame" = is.data.frame(dfInput))`)
    -   [ ] Tests confirm that `stopifnot()` parameter checks are working as expected.
    -   [ ] Tests confirm that the input data has required columns (if any).
    -   [ ] Tests confirm that the output data has expected columns/structure.
    -   [ ] Tests confirm intended functionality for each parameter.
    -   [ ] Tests confirm that missing data in required columns is handled appropriately and errors/warnings are produced if needed.
-   [ ] Basic QC
    -   [ ] Code is well commented and easy to read/understand.
    -   [ ] No file paths or other company-specific data are present.
    -   [ ] Function called from dependencies are called via `::`.
    -   [ ] `devtools::check()` passes with no errors/warnings/notes.
    -   [ ] Package documents are up to date, and running `devtools::document()` does not change any files.
    -   [ ] Codes use `{tidyverse}` best practices for standard data manipulation. If unclear, reviewer should start a discussion thread.
    -   [ ] All new dependencies add significant value. If unclear, reviewer should start a discussion thread.
    -   [ ] All GitHub Actions run with no errors.

## Appendix 3 - Continuous Integration with GitHub Actions {#github-action-workflow}

GitHub Actions are used in `{gsm.app}` to automate processes and ensure all code and documentation is created consistently and documented thoroughly.

### Merges to `dev` Branch

-   R CMD Check (`R-CMD-check-dev`):
    -   Basic R CMD check which can be run using `rcmdcheck::rcmdcheck()`
    -   This check will run on `ubuntu-latest` and on R version 4.1.3.
-   Test Coverage (`test-coverage`):
    -   Uses `{covr}` to check the package coverage of `{gsm.app}`.

## Merges to `main` Branch

-   R CMD Check (`R-CMD-check`):
    -   Basic R CMD check which can be run using `rcmdcheck::rcmdcheck()`
    -   This check will run on `ubuntu-latest` and on R version 4.1.3. Additionally, it will be run on the latest R release version on `windows-latest`, `macOS-latest`, and `ubuntu-latest`.
-   `pkgdown`:
    -   Builds the [pkgdown site](https://gilead-biostats.github.io/gsm.app/) for `{gsm.app}`.

## Code of Conduct

Please note that the gsm.app project is released with a
[Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this
project you agree to abide by its terms.
