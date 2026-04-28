# Ingest Data Reactively

Ingest Data Reactively

## Usage

``` r
srvr_IngestReactive(
  l_rctvDomains,
  lSpec,
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

- lSpec:

  `list` A named list defining the data domains required by the plugin,
  where the names are the names of the domains and the elements are
  column definitions.

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

A named list of ingested data.
