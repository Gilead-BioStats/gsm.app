# GroupOverview Dependencies

GroupOverview Dependencies

## Usage

``` r
htmlDependency_GroupOverview()
```

## Value

An
[`htmltools::tagList()`](https://rstudio.github.io/htmltools/reference/tagList.html)
of `html_dependency` objects (see
[`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)),
so that each will be attached to the Shiny app exactly once, regardless
of how many times they are added.
