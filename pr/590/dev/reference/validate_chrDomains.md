# Confirm that an object is valid chrDomains

Confirm that an object is valid chrDomains

## Usage

``` r
validate_chrDomains(chrDomains, lPlugins = NULL, envCall = rlang::caller_env())
```

## Arguments

- chrDomains:

  `character` A (named) vector of domains to include in the app. The
  values of the vector will be used as labels, and the names will be
  used as IDs. The IDs will be passed to `fnFetchData()` to fetch data
  about that domain.

- lPlugins:

  `list` Optional list of plugins to include in the app.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

`chrDomains` with names in all caps.
