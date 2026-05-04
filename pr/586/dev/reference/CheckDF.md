# Confirm that an object is the expected df

Confirm that an object is the expected df

## Usage

``` r
CheckDF(
  x,
  chrRequiredColumns = character(),
  strArg = rlang::caller_arg(df),
  envCall = rlang::caller_env()
)
```

## Arguments

- x:

  An object to validate.

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

`x`, if it passes the checks.
