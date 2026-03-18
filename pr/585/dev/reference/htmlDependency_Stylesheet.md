# gsm.app stylesheet

Attach a stylesheet from this package to an app or other HTML exactly
once.

## Usage

``` r
htmlDependency_Stylesheet(
  filename,
  name = sub("\\.css$", "", filename),
  version = "1.0.0"
)
```

## Value

An `html_dependency` object (see
[`htmltools::htmlDependency()`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)),
which is attached to the Shiny app exactly once, regardless of how many
times it is added.
