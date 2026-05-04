# Check that a vector is in another vector

Check that a vector is in another vector

## Usage

``` r
CheckIsIn(x, chrAllowedValues, strWhat = rlang::caller_arg(x), envCall)
```

## Arguments

- x:

  An object to validate.

- chrAllowedValues:

  `character` A vector of allowed values for a vector.

- strWhat:

  `character` A sentence-case description of the object being inspected.

- envCall:

  `environment` The environment from which this function was called, for
  use in better error messages. This value should usually be left as the
  default, or passed from the calling function if the calling function
  also has an `envCall` argument.

## Value

The validated object.
