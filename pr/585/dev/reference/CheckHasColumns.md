# Confirm that a data.frame has required columns

Confirm that a data.frame has required columns

## Usage

``` r
CheckHasColumns(
  df,
  chrRequiredColumns = character(),
  strArg = rlang::caller_arg(df),
  envCall = rlang::caller_env()
)
```

## Arguments

- df:

  The data.frame to validate.

- chrRequiredColumns:

  `character` A vector of expected columns in a data.frame.

- strArg:

  `character` The name of the argument in the calling function. In
  general, this value should either be left as the default, or passed
  from the calling function if the calling function also has a `strArg`
  argument.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

`df`, if it is has columns with the required names.
