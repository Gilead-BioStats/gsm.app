# Confirm that an object is a string

Confirm that an object is a string

## Usage

``` r
CheckIsString(x, strArg = rlang::caller_arg(x), envCall = rlang::caller_env())
```

## Arguments

- x:

  The object to validate.

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

`x`, if it is a length-1 character vector and isn't `NA`.
