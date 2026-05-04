# Merge Used Hashes

Merge Used Hashes

## Usage

``` r
srvr_CombineHashes(l_rctvDomainHashes, lSpec)
```

## Arguments

- l_rctvDomainHashes:

  `list` A named list of
  [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
  objects, each of which returns the
  [`rlang::hash()`](https://rlang.r-lib.org/reference/hash.html) of a
  domain dataframe.

- lSpec:

  `list` A named list defining the data domains required by the plugin,
  where the names are the names of the domains and the elements are
  column definitions.

## Value

A [`shiny::reactive()`](https://rdrr.io/pkg/shiny/man/reactive.html)
that returns a string with the hashes of the loaded domains concatenated
with "-".
