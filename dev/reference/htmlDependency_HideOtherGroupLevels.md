# HideGroupLevel JavaScript

Attach `hideOtherGroupLevels.js` to an app or other HTML exactly once.

## Usage

``` r
htmlDependency_HideOtherGroupLevels()
```

## Value

An `html_dependency` object (see
[`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)),
which is attached to the Shiny app exactly once, regardless of how many
times it is added.
