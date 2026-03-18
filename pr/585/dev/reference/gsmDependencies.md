# Get dependencies for a gsm widget

Get dependencies for a gsm widget

## Usage

``` r
gsmDependencies(strWidgetName, excludes = character())
```

## Arguments

- strWidgetName:

  `character` The name of a widget in the gsm package.

- excludes:

  An optional vector of named dependencies to *not* include.

## Value

A list of
[`htmltools::htmlDependency`](https://rstudio.github.io/htmltools/reference/htmlDependency.html)
objects for use in
[`htmlwidgets::createWidget()`](https://rdrr.io/pkg/htmlwidgets/man/createWidget.html).
