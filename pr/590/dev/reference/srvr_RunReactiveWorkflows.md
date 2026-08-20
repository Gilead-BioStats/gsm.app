# Run Workflows Reactively

Run Workflows Reactively

## Usage

``` r
srvr_RunReactiveWorkflows(
  l_rctvDomains,
  lWorkflows,
  l_rctvDomainHashes,
  rctv_bPluginReady,
  strCache = NULL
)
```

## Arguments

- l_rctvDomains:

  `list` A named list of lists of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects. Each list contains a "Study" element, a "Group" element, and
  a "Selection" element, each of which returns a domain dataframe.

- lWorkflows:

  `list` An optional named list of workflows to run in order to
  translate app domain data into the format required by the plugin (as
  defined in the plugin `spec`). These workflows are ran before the
  plugin's `spec` is applied, and are meant to serve as a bridge between
  your domain data and the plugin's expected domains.

- l_rctvDomainHashes:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe.

- rctv_bPluginReady:

  `reactive Boolean` A
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  object that returns `TRUE` if all inputs required by the plugin are
  non-empty, and `FALSE` if one or more inputs are not ready.

- strCache:

  `character` An additional string to ensure that a cache key is unique.

## Value

A named list of the final output from `lWorkflows`, where the names are
the names of the final results.
