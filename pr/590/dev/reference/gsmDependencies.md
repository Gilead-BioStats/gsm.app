# Get dependencies for a gsm widget

Reads the widget's dependency manifest from gsm.vizr, which owns the
gsm.viz bundle and the shared control-lib scripts as a published runtime
surface. gsm.app ships its own forked widget JS and YAML; this supplies
only the renderer assets those forks call into.

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
