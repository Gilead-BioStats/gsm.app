# gsm.app design principles

*This is an experiment in making key package design principles explicit, versus only implicit in the code. The goal is to make maintenance easier, when spread out over time and across people. This idea was copied from [usethis](https://github.com/r-lib/usethis/blob/main/principles.md).*

*These principles are a work in progress.*

## Argument names and documentation

- Function arguments should be prefixed with an abbreviation describing their expected class:
  - `df` (eg: `dfBounds`) = data.frame
  - `l` (eg: `lAssessment`) = list
  - `str` (eg: `strMetricID`) = length-1 character vector
- The remainder of the argument name should use camelCase.
- If an argument is expected to be reactive (as in `shiny::reactive()`), it should be prefixed by `rctv_`, and then follow the rules above for the value *returned* by that reactive function. For example, a reactive expression that returns a MetricID string should be `rctv_strMetricID`.
- If an argument is used more than once, document it in `R/aaa-shared.R`.
  - Within the function help, use `#' @inheritParams shared-params` to inherit globally defined parameters.
  - Arguments should be alphabetized in this document to make it easier to find whether they have already been documented.
  - Note: If a parameter is documented in a function, that definition will override the imported definition, even with `@inheritParams shared-params` (so it's safe to use that pretty much everywhere).

## Minimize reactivity

If a function makes sense to be non-reactive, make it non-reactive. This applies even if the return is built out of HTML components, for example using `tagList()`. The module that calls the function can pass in an (evaluated) reactive expression to make the result reactive, but the function itself should be non-reactive whenever possible.

(tentative) Only `mod_*_Server()` functions should have `rctv_*` arguments, and only `mod_*_Server()` functions should return reactive expressions.

## Don't namespace shiny

I've gone back and forth on this one, but the current rule is to skip namespace for {shiny} functions, particularly for basic HTML elements (reexported from {htmltools} by {shiny}). So `div()`, not `shiny::div()` nor `htmltools::div()` nor `htmltools::tag$div()`.

However, *do* use the namespace for anything in {htmltools} that isn't reexported by {shiny}, such as `htmltools::htmlDependency()`. This exception is why I've gone back and forth on this rule.

## Avoid over-complicated pipes

For simple variable selection and filtering, use base R. For example, instead of this:

```r
df %>% 
  dplyr::filter(.data$colA == strA) %>% 
  dplyr::select("colB") %>% 
  dplyr::arrange(.data$colB) %>% 
  dplyr::pull("colB")
```

Use this:

```r
sort(df$colB[df$colA == strA])
```

This rule is still being formalized, so you will likely find places where code does not follow this rule, and we may change our minds.

## Modularize everything

Try to keep each function as short as it can be while still making sense. To accomplish this, break off logical pieces into functions (including shiny modules).

This rule applies even for code that is only used once. It is easier to follow this logic:

```r
gsm_ui <- function() {
  fluidPage(
    title = "GSM Deep Dive",
    theme = bslib::bs_theme(version = 5),
    uiSetStyle(),
    mod_StudySummary_ui(),
    mod_gsmNavset_ui()
  )
}
```

Than this:

```r
gsm_ui <- function() {
  fluidPage(
    shinyjs::useShinyjs(),
    class = "bg-light",
    style = "min-height: 100vh;",
    title = "GSM Deep Dive",
    theme = bslib::bs_theme(version = 5),
    htmltools::includeCSS(
      system.file("www", "styles.css", package = "gsm.app")
    ),
    div(
      # etc
    ),
    div(
      div(
        div(
          div(
            div(
              div(
                # etc
              ),
              div(
                # etc
              )
            )
          )
        )
      ),
      div(
        bslib::navset_bar(
          # etc
        )
      )
    )
  )
}
```

## Separate UI and Server files

For modules, create two files: `mod_ModuleName_UI.R` and `mod_ModuleName_Server.R`. The UI function and its (small, not reused) helper functions go in the first one, and the server function and its (small, not reused) helper functions go in the other. It's theoretically easier to have them both open and tab between them (or open them side-by-side) than to scroll up and down in one file.

This is noted here specifically *because* I'm going back and forth about how I feel about this.
